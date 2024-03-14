import 'dart:convert';

import 'package:api_with_getx_project/app/data/models/news_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class NewsController extends GetxController {
  //TODO: Implement NewsController
  Future<Articles?> getData(String cat) async {
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=${cat}&apiKey=6bb83f062fe745afb047531857b8f871");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        return Articles.fromJson(jsonDecode(response.body));
      } catch (e) {
        Get.snackbar("error", e.toString()); // snakebar=400,500
        return null; // Retourner null en cas d'erreur
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
RxInt currentIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => currentIndex.value++;
}
