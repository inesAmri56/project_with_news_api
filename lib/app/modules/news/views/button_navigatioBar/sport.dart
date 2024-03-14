import 'package:api_with_getx_project/app/data/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/news_controller.dart';

class Sports extends GetView<NewsController> {
  Sports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Articles?>(
        future: controller.getData("sports"),
        builder: (context, AsyncSnapshot<Articles?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            Articles data = snapshot.data!;
            return ListView.builder(
              itemCount: data.articles.length,
              itemBuilder: (context, int index) {
                return Card(
                  elevation: 10,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 150,
                        child: Image.network(
                          data.articles[index].urlToImage.toString(),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data.articles[index].title.toString(),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data.articles[index].description.toString(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
