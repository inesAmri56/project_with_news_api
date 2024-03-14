import 'package:api_with_getx_project/app/data/models/news_model.dart';
import 'package:api_with_getx_project/app/modules/news/views/button_navigatioBar/health.dart';
import 'package:api_with_getx_project/app/modules/news/views/button_navigatioBar/science.dart';
import 'package:api_with_getx_project/app/modules/news/views/button_navigatioBar/sport.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/news_controller.dart';

class NewsView extends GetWidget<NewsController> {
  NewsView({Key? key}) : super(key: key);

  final List<Widget> screen = [
    Sports(),
    Science(),
    Health(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App News"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        selectedItemColor: Colors.blue,

        onTap: (val) {
          controller.currentIndex.value = val;
        },
        items: [
          BottomNavigationBarItem(
            label: "sports",
            icon: Icon(Icons.sports),
          ),
          BottomNavigationBarItem(
            label: "Science",
            icon: Icon(Icons.science),
          ),
          BottomNavigationBarItem(
            label: "health",
            icon: Icon(Icons.health_and_safety),
          ),
        ],
      ),
      // Correction: Utilisez GetBuilder ou Obx pour observer les changements de currentIndex
      body: Obx(() => screen[controller.currentIndex.value]),

    );
  }
}
