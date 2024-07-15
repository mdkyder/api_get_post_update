import 'package:flutter/material.dart';

class DetilesPage extends StatefulWidget {


  const DetilesPage({super.key});

  @override
  State<DetilesPage> createState() => _DetilesPageState();
}

class _DetilesPageState extends State<DetilesPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key:_formKey ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
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
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
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

              SizedBox(height: 20,),

              TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  focusColor: Colors.grey,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.8)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Slug';
                  }
                  return null;
                },
              ),

              SizedBox(height: 20,),
              ElevatedButton(

                  onPressed: (){
                    if (_formKey.currentState!.validate()){}
                  }, child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
