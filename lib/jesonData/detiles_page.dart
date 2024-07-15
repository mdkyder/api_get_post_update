import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/getpost_controller.dart';

class DetilesPage extends StatefulWidget {
  const DetilesPage({super.key});

  @override
  State<DetilesPage> createState() => _DetilesPageState();
}

class _DetilesPageState extends State<DetilesPage> {
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    GetPostController controller = Get.put(GetPostController());

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller:controller. titleTextEditingController,
                decoration: const InputDecoration(
                    hintText: "Title",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.8),
                    ),
                    fillColor: Colors.grey,
                    focusColor: Colors.grey),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Title';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller:controller. contentTextEditingController,
                decoration: InputDecoration(
                  hintText: "Content",
                  fillColor: Colors.grey,
                  focusColor: Colors.grey,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.8)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Content';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Map<String, String> body = {
                        "title": controller.titleTextEditingController.text,
                        "content":controller. contentTextEditingController.text,
                      };

                      print(body);
                      controller.createPost(body);
                    }
                  },
                  child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
