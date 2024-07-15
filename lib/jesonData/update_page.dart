import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/getpost_controller.dart';
import '../model/get_post_model.dart';

class UpdatePage extends StatefulWidget {
   UpdatePage({super.key,required this.model});
  GetPostModel model;
  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final _formKey = GlobalKey<FormState>();

  GetPostController controller = Get.put(GetPostController());

  @override
  void initState() {

    controller.titleTextEditingController=TextEditingController(text: widget.model.title.toString());
    controller.contentTextEditingController=TextEditingController(text: widget.model.content.toString());
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
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
                        "title":controller. titleTextEditingController.text,
                        "content":controller. contentTextEditingController.text,
                      };

                      print(body);
                      // controller.updateDataPost(widget.model.id.toString(),body);
                      controller.updateDataPut(widget.model.id.toString(),body);
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
