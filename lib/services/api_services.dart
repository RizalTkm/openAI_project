import 'dart:convert';
import 'dart:developer';

import 'package:chat_gpt_application/constants/api_helpers.dart';
import 'package:chat_gpt_application/models/aiModels_response_model.dart';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final _dio = Dio(BaseOptions(
      baseUrl: ApiHelpers.baseUrl,
      headers: {"Authorization": "Bearer ${ApiHelpers.apikeys}"}));

  getAiModels() async {
    print("function called");
    try {
      final response = await _dio.get("/models");

      final resultList =
          AimodelsResponseModel.fromJson(response.data).data?.toList();

      var list = [];

      for (var i in resultList!) {
        list.add(i.id);
      }

      print(list);

      return list;
    } catch (e) {
      print(e);
    }
  }

  static getAiModelsHttp() async {
    try {
      var response = await http.get(Uri.parse("$baseUrl/models"),
          headers: {'Authorization': 'Bearer $OPENAI_API_KEY'});

      print(response.body);
    } catch (e) {
      print(e);
    }
  }
}
