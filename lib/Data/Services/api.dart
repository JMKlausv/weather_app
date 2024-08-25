import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as Http;
import 'package:weather_forcast_app/Business%20Logic/Algorithm/helpers.dart';

import '../Data Providers/app_constants.dart';

class ApiClient {
  String appBaseUrl = AppConstants.baseUrl;
  final String noInternetMessage =
      'Connection to API server failed due to internet connection';
  final int timeoutInSeconds = 20;

  String? token;
  Map<String, String>? _mainHeaders;

  ApiClient() {
    _mainHeaders = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    };
  }

  Future<dynamic> getData(String uri, {Map<String, String>? headers}) async {
    if (kDebugMode) {
      print('++++++++main $_mainHeaders');
      print('====> API Call: $appBaseUrl');

      print('====> API Call: $uri');
    }
    Http.Response _response = await Http.get(
      Uri.parse(appBaseUrl + uri),
      headers: headers ?? _mainHeaders,
    ).timeout(Duration(seconds: timeoutInSeconds));
    print('====> API API API API Call: $uri\nToken: $_response');
    print(_response.body);

    // Check if the response body is not empty
    if (_response.body.isNotEmpty) {
      // Directly decoding the JSON response
      var responseJson = jsonDecode(utf8.decode(_response.bodyBytes));
      print("decoded json is -- \n $responseJson");

      if (_response.statusCode == 200 || _response.statusCode == 201) {
        return Response(jsonEncode(responseJson), _response.statusCode,
            headers: _mainHeaders!);
      } else {
        throw Exception('Error: ${_response.body}');
      }
    } else {
      throw Exception('Something Went Wrong');
    }
  }

  Future<dynamic> postData(String uri, dynamic body,
      {Map<String, String>? headers}) async {
    headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    print('====> GetX Base URL: $appBaseUrl');
    print('====> GetX Call: $uri');
    print('====> GetX Body: $body');

    Http.Response _response = await Http.post(
      Uri.parse(appBaseUrl + uri),
      body: jsonEncode(body),
      headers: _mainHeaders ?? headers,
    ).timeout(Duration(seconds: timeoutInSeconds));

    if (_response.body.isNotEmpty) {
      var response = jsonDecode(_response.body);
      if (_response.statusCode == 200 || _response.statusCode == 201) {
        return Response(_response.body, _response.statusCode, headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        });
      } else {
        throw Exception('Error: ${response['message']}');
      }
    } else {
      throw Exception('Something Went Wrong');
    }
  }

  Future<Response> putData(String uri, dynamic body,
      {Map<String, String>? headers}) async {
    headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    // await readToken();
    print('====> GetX Base URL: $appBaseUrl');
    print('====> GetX Call: $uri');
    print('====> GetX Body: $body');

    Http.Response _response = await Http.put(
      Uri.parse(appBaseUrl + uri),
      body: jsonEncode(body),
      headers: _mainHeaders ?? headers,
    ).timeout(Duration(seconds: timeoutInSeconds));

    if (_response.body.isNotEmpty) {
      var response = jsonDecode(_response.body);
      if (_response.statusCode == 200 || _response.statusCode == 201) {
        return Response(_response.body, _response.statusCode);
      } else {
        throw Exception('Error: ${response['message']}');
      }
    } else {
      throw Exception('Something Went Wrong');
    }
  }

  Response handleResponse(Http.Response response) {
    dynamic _body;
    try {
      _body = jsonDecode(response.body);
    } catch (e) {}

    Response _response = Response(_body, response.statusCode);
    print('itskjsk');
    if (_response.statusCode != 200 ||
        _response.body.isEmpty ||
        _response.statusCode != 201) {
      _response = Response(_response.body, _response.statusCode);
    }
    return _response;
  }
}
