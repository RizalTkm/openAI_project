import 'package:chat_gpt_application/services/api_services.dart';
import 'package:flutter/cupertino.dart';

class ApiserviceProviders extends ChangeNotifier {
  var list = [];

  fetchAiModels() {
    list = ApiServices().getAiModels();

    notifyListeners();
    return list;
  }
}
