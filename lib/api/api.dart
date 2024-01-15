// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiHelper {
  static const String _baseUrl = "https://jsonplaceholder.typicode.com";

  static Future<Map<String, String>?> getHeader() async {
    Map<String, String>? header = {
      "Content-Type": "application/json",
    };
    return header;
  }

  static Future<dynamic> get(String endpoint,
      {Map<String, String>? queryParams}) async {
    var responseJson;

    try {
      Map<String, String>? header;
      header = await getHeader();
      final response = await http.get(
        Uri.parse('$_baseUrl$endpoint').replace(
          queryParameters: queryParams,
        ),
        headers: header,
      );

      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('No Internet connection');
    }
    return responseJson;
  }

  static dynamic _returnResponse(dynamic response) async {
    try {
      switch (response.statusCode) {
        case 200:
        case 201:
          return jsonDecode(response.body);

        default:
          throw ('Error occured while Communication with Server with StatusCode : ${response.statusCode}');
      }
    } catch (e) {}
  }
}
