import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:motiv_hackathon_app/data/api/real/handlers/resume.dart';
import 'package:motiv_hackathon_app/models/job_seeker_user.dart';

import 'config.dart';

void main() {
  test('Get Resumes', () async {
    final regHandlers = ResumeHeaders(apiPath: TestServerConfig.path);
    Response response = await regHandlers.getResumes();
    for (var resume in response.data) {
      print(JobSeekerUser.fromMap(resume).toString());
    }
    expect(response.statusCode, 200);
  });
}
