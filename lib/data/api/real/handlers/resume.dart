import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:motiv_hackathon_app/models/job_seeker_user.dart';

class ResumeHeaders {
  final String _apiPath;
  final String _middleWare = '';
  final String _getResumesHandler = 'getResumes';
  final String _likeHandler = 'like/';
  ResumeHeaders({@required String apiPath}) : _apiPath = apiPath;

  Future<Response> getResumes() async {
    Response response;
    try {
      response = await Dio().get(
        _apiPath + _middleWare + _getResumesHandler,
      );
    } catch (e) {}
    return response;
  }

  Future<Response> like(JobSeekerUser user, bool state) async {
    Response response;
    try {
      response = await Dio().get(
        _apiPath + _middleWare + _likeHandler + user.id + "/$state",
      );
    } catch (e) {}
    return response;
  }
}
