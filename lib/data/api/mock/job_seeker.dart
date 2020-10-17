import 'package:motiv_hackathon_app/models/job_seeker_user.dart';

const List<JobSeekerUser> _jobSeekers = [];

Future<List<JobSeekerUser>> getJobSeekers() async {
  return _jobSeekers;
}
