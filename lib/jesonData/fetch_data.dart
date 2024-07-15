import 'package:fetchdata/jesonData/update_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../controller/getpost_controller.dart';
import 'detiles_page.dart';

class FetchData extends StatelessWidget {
  const FetchData({super.key});

  @override
  Widget build(BuildContext context) {
    GetPostController controller = Get.put(GetPostController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DetilesPage()));
        },
        child: Icon(Icons.add),
      ),
      body: Obx(
        () => ListView.builder(
            shrinkWrap: true,
            itemCount: controller.getPostModel.value.length,
            itemBuilder: (BuildContext context, int index) {

              var data=controller.getPostModel.value[index];
              return Container(
                margin: EdgeInsets.all(14),
                height: 100,
                color: Colors.cyanAccent,
                child: ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      controller.updateDataDeleted(data.id);
                    },
                  ),
                  title: Text(
                      "Title :${data.title}"),
                  subtitle: Text(
                    "Content : ${data.content}",
                    maxLines: 2,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {

                      // controller.titleTextEditingController=TextEditingController(text: data.title);
                      // controller.contentTextEditingController=TextEditingController(text: data.content);

                      // print(controller.getPostModel.value[index].title.toString());
                      print(controller.titleTextEditingController.text);
                      //
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdatePage(model: data,)));
                    },
                  ),
                ),
              );
            }),
      ),
    );
  }
}
