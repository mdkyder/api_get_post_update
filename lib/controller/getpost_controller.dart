import 'dart:convert';

import 'package:fetchdata/model/get_post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetPostController extends GetxController {
  Rx<List<GetPostModel>> getPostModel = Rx<List<GetPostModel>>([]);

  @override
  void onInit() {
    super.onInit();
    getPostData(); // Fetch data on initialization
  }


  TextEditingController titleTextEditingController = TextEditingController();
   TextEditingController contentTextEditingController = TextEditingController();
  void getPostData() async {
    Uri uri = Uri.parse("https://jsonplaceholder.org/posts");

    try {
      final response = await http.get(uri).timeout(Duration(seconds: 40));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body) as List;
        List<GetPostModel> posts =
            jsonData.map((json) => GetPostModel.fromJson(json)).toList();
        getPostModel.value = posts;
      } else {
        print('Request failed with status :${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching data:$e");
    }
  }

  //post data from server

  cler(){
    titleTextEditingController.clear();
    contentTextEditingController.clear();
  }

  void createPost(Map body) async {
    Uri uri = Uri.parse("https://jsonplaceholder.org/posts");

    try {
      final response = await http.post(
        uri,
        body: jsonEncode(body),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 201) {
        print("response.body${response.body}");
        cler();
        print('Post created successfully');
        // Optionally fetch updated data after creating post
        getPostData();
      } else {
        print('Failed to create post. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // print('Error creating post: $e');
    }
  }
  void updateDataPost(String postId,Map body) async {
    Uri uri = Uri.parse("https://jsonplaceholder.org/posts/$postId");

    try {
      final response = await http.patch(
        uri,
        body: jsonEncode(body),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        print('Post updated successfully');
        print("response.body${response.body}");
        // Optionally fetch updated data after updating post
        // getPostData();
      } else {
        print('Failed to update post. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error updating post: $e');
    }
  }
  void updateDataPut(String postId,Map body) async {
    Uri uri = Uri.parse("https://jsonplaceholder.org/posts/$postId");

    try {
      final response = await http.put(
        uri,
        body: jsonEncode(body),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        print('Post updated successfully');
        print("response.body${response.body}");
        // Optionally fetch updated data after updating post
        getPostData();
      } else {
        print('Failed to update post. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error updating post: $e');
    }
  }


  void updateDataDeleted(postId) async {
    Uri uri = Uri.parse("https://jsonplaceholder.org/posts/$postId");

    try {
      final response = await http.delete(
        uri,
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        print('Post delete successfully');
        print("response.body${response.body}");
        // Optionally fetch updated data after updating post
        getPostData();
      } else {
        print('Failed to update post. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error updating post: $e');
    }
  }




}

//patch /Update data from server


// import 'dart:convert';
//
// import 'package:fetchdata/model/get_post_model.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
// class GetPostController extends GetxController {
//   Rx<List<GetPostModel>> getPostModel = Rx<List<GetPostModel>>([]);
//
//   @override
//   void onInit() {
//     super.onInit();
//     getPostData(); // Fetch data on initialization
//   }
//
//   void getPostData() async {
//     Uri uri = Uri.parse("https://jsonplaceholder.org/posts");
//     try {
//       final response = await http.get(uri).timeout(Duration(seconds: 40));
//       if (response.statusCode == 200) {
//         var jsonData = jsonDecode(response.body) as List;
//         List<GetPostModel> posts =
//             jsonData.map((json) => GetPostModel.fromJson(json)).toList();
//         getPostModel.value = posts;
//       } else {
//         print('Request failed with status :${response.statusCode}');
//       }
//     } catch (e) {
//       print("Error fetching data:$e");
//     }
//   }
// }

// void getPostData() async {
//   Uri uri = Uri.parse("https://jsonplaceholder.org/posts");
//   try {
//     final response = await http.get(uri).timeout(Duration(seconds: 30));
//     if (response.statusCode == 200) {
//       var jsonData = jsonDecode(response.body) as List;
//       List<GetPostModel> posts =
//       jsonData.map((json) => GetPostModel.fromJson(json)).toList();
//       getPostModel.value = posts;
//     } else {
//       print('Request failed with status: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error fetching data: $e');
//   }
// }
