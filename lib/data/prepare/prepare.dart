import 'package:dio/dio.dart';
import 'package:motiv_hackathon_app/data/api/real/server.dart';
import 'package:motiv_hackathon_app/models/human_resource_user.dart';
import 'package:motiv_hackathon_app/models/job_seeker_user.dart';

class RequestPrepare {
  static Future<bool> loginUser(HumanResourceUser user) async {
    final response = await Server.regHandlers.login(user);
    return response.statusCode == 200;
  }

  static Future<List<JobSeekerUser>> getResumesList() async {
    Response response = await Server.resumeHeaders.getResumes();
    List<JobSeekerUser> resumes = [];
    for (var resume in response.data)
      resumes.add(JobSeekerUser.fromMap(resume));
    return resumes;
  }
}
