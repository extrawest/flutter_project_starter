import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider_starter_app/network/exception.dart';

class ApiService {
  final String baseApiUrl;

  static const String POSTS_PATH = '/posts';

  Map<String, String> headers = {"Content-type": "application/json"};

  ApiService({@required this.baseApiUrl});

  Future<dynamic> get(String url, {Map<String, String> addHeaders}) async {
    var responseJson;
    Map<String, String> updatedHeaders = {};

    if (addHeaders != null) {
      updatedHeaders.addAll(headers);
      updatedHeaders.addAll(addHeaders);
    }

    try {
      final response = await http.get(baseApiUrl + url, headers: updatedHeaders);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, String jsonBody, {Map<String, String> addHeaders}) async {
    var responseJson;
    Map<String, String> updatedHeaders = {};

    if (addHeaders != null) {
      updatedHeaders.addAll(headers);
      updatedHeaders.addAll(addHeaders);
    }

    try {
      final response = await http.post(baseApiUrl + url, body: jsonBody, headers: updatedHeaders);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException('Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
