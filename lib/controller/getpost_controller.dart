

import 'dart:convert';

import 'package:fetchdata/model/get_post_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetPostController extends GetxController {
  Rx<List<GetPostModel>> getPostModel = Rx<List<GetPostModel>>([]);

  @override
  void onInit() {
    super.onInit();
    getPostData(); // Fetch data on initialization
  }

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

  void createPost(String title, String body) async {
    Uri uri = Uri.parse("https://jsonplaceholder.org/posts");

    try {
      final response = await http.post(
        uri,
        body: jsonEncode({
          'title': title,
          'body': body,
          'userId': 1, // Assuming a userId is required
        }),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 201) {
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
}





//patch /Update data from server


void updatePost(int postId, String title, String body) async {
  Uri uri = Uri.parse("https://jsonplaceholder.org/posts/$postId");

  try {
    final response = await http.patch(
      uri,
      body: jsonEncode({
        'title': title,
        'body': body,
      }),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      print('Post updated successfully');
      // Optionally fetch updated data after updating post
      // getPostData();
    } else {
      print('Failed to update post. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error updating post: $e');
  }
}





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
