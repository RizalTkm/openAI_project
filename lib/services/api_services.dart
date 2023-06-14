import 'dart:convert';

import 'package:chat_gpt_application/constants/api_helpers.dart';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final _dio = Dio(BaseOptions(
      baseUrl: ApiHelpers.baseUrl,
      headers: {"Authorization": "Bearer${ApiHelpers.apikeys}"}));

  getAiModels() async {
    print("function called");
    try {
      final response = await _dio.get("/models");

      print(response.data);
    } catch (e) {
      print(e);
    }
  }

  static getAiModelsHttp() async {
    var parsedUri = Uri.parse("$baseUrl/models");
    var headerData = {'Authorization': 'Bearer $OPENAI_API_KEY'};

    var result = await http.get(parsedUri, headers: headerData);

    if (result.statusCode == 200) {
      print(result.body);
    } else {
      print(result.statusCode);
    }
  }

  static getQueryResponse() async {
    var parsedUri = Uri.parse("$baseUrl/chat/completions");
    var headerData = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $OPENAI_API_KEY"
    };
    var bodyData = jsonEncode({
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "user", "content": "what is flutter"}
      ],
      "temperature": 0.7
    });
    var result =
        await http.post(parsedUri, headers: headerData, body: bodyData);

    print(result.body);
  }
}
