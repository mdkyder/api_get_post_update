import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

import '../controller/getpost_controller.dart';
import 'detiles_page.dart';


class FetchData extends StatelessWidget {
  const FetchData({super.key});

  @override
  Widget build(BuildContext context) {
    GetPostController controller=Get.put(GetPostController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetilesPage()));

        },
        child: Icon(Icons.add),
      ),
      body: Obx(
          ()=> ListView.builder(
          shrinkWrap: true,
            itemCount: controller.getPostModel.value.length,
            itemBuilder: (BuildContext context,int index){
          return Container(
            margin: EdgeInsets.all(14),
            height: 100,
            color: Colors.cyanAccent,

            child: ListTile(
              onTap: (){
              },
              title: Text("Title :${controller.getPostModel.value[index]}"),
              subtitle: Text("It is Sub Title"),
              trailing: Icon(Icons.edit,),
            ),
          );

        }
        ),
      ),

    );
  }
}
