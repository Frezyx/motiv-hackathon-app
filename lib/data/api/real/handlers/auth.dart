import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:motiv_hackathon_app/models/human_resource_user.dart';

class AuthHandlers {
  final String _apiPath;
  final String _middleWare = '';
  final String _loginHandler = 'login';
  AuthHandlers({@required String apiPath}) : _apiPath = apiPath;

  Future<Response> login(HumanResourceUser user) async {
    Response response;
    try {
      response = await Dio().post(
        _apiPath + _middleWare + _loginHandler,
        data: user.toMap(),
      );
    } catch (e) {}
    return response;
  }
}
