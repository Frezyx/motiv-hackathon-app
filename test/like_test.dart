import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:motiv_hackathon_app/data/api/real/handlers/resume.dart';
import 'package:motiv_hackathon_app/models/job_seeker_user.dart';

import 'config.dart';

void main() {
  test('Like Resume', () async {
    final regHandlers = ResumeHeaders(apiPath: TestServerConfig.path);
    Response response = await regHandlers.getResumes();
    List<JobSeekerUser> users = [];
    for (var resume in response.data) {
      users.add(JobSeekerUser.fromMap(resume));
    }
    Response responseLike = await regHandlers.like(users[0], true);
    expect(responseLike.statusCode, 200);
  });
}
