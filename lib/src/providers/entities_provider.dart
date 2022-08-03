import 'dart:convert';

import 'package:app_pedia/src/model/entities.dart';
import 'package:app_pedia/src/model/idioms.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class EntitiesProvider with ChangeNotifier {
  final String url = "https://api.dbpedia-spotlight.org/en/";
  final String apiUrl = "https://flask-sbc.herokuapp.com/entity/";
  String searchText = "";
  bool apiResponseIsLoadig = false;
  bool isLoadding = false;
  late Entities entities;
  late ApiResponse apiResponse;

  set loading(bool value) {
    isLoadding = value;
    notifyListeners();
  }

  set loadingApi(bool value) {
    apiResponseIsLoadig = value;
    notifyListeners();
  }

//Ecuador is beautiful country, I love Ecuador. Ecuador es un  país hermoso, me encanta Ecuador.
  bool get loading => isLoadding;
  getApiResponse(String text) async {
    try {
      loadingApi = true;
      final url = '$apiUrl$text';
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      apiResponse = ApiResponse.fromJson(json.decode(response.body));
      loadingApi = false;
    } catch (e) {
      loadingApi = false;
      print(e);
    }
  }

  getAnnotations(String text, String confidence) async {
    loading = true;
    try {
      String url = "${this.url}annotate?text=$text&confidence=$confidence";
      final uri = Uri.parse(url);
      final resp = await http.get(uri, headers: {
        "Accept": "application/json",
      });
      entities = Entities.fromMap(json.decode(resp.body));
      if (entities.resources.length > 1) {
        loading = false;
        return {
          "rta": true,
          "text": "Se encontraron ${entities.resources.length} resultados",
          "entities": entities.resources,
        };
      } else {
        return {
          "rta": true,
          "text": "No se encontraron resultados",
          "entities": entities.resources,
        };
      }
    } catch (e) {
      loading = false;
      return {
        "rta": false,
        "text": "No se encontraron resultados",
      };
    }
  }
}
