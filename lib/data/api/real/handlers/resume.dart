import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ResumeHeaders {
  final String _apiPath;
  final String _middleWare = '';
  final String _getResumes = 'getResumes';
  ResumeHeaders({@required String apiPath}) : _apiPath = apiPath;

  Future<Response> getResumes() async {
    Response response;
    try {
      response = await Dio().get(
        _apiPath + _middleWare + _getResumes,
      );
    } catch (e) {}
    return response;
  }
}
