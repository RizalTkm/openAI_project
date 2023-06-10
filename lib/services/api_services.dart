

import 'package:chat_gpt_application/constants/api_helpers.dart';
import 'package:chat_gpt_application/models/aiModels_response_model.dart';
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
    

    try {
      var response = await http.get(Uri.parse("$baseUrl/models"),
      headers:{'Authorization': 'Bearer $apikeys'} );

      print(response.body);
    } catch (e) {

      print(e);
      
    }

  }
}