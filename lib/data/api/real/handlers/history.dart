import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HistoryHeaders {
  final String _apiPath;
  final String _middleWare = '';
  final String _getHistoryHandler = 'history';
  HistoryHeaders({@required String apiPath}) : _apiPath = apiPath;

  Future<Response> getHistory() async {
    Response response;
    try {
      response = await Dio().get(
        _apiPath + _middleWare + _getHistoryHandler,
      );
    } catch (e) {}
    return response;
  }
}
