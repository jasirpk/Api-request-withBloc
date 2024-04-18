import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:public_api_bloc/models/post_data_ui_model.dart';

class PostRepo {
  static Future<List<PostDataUiModel>> fecthPosts() async {
    var client = http.Client();
    List<PostDataUiModel> posts = [];
    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        PostDataUiModel post =
            PostDataUiModel.fromJson(result[i] as Map<String, dynamic>);
        posts.add(post);
      }
      return posts;
    } catch (e) {
      log(e.toString() as num);
      return [];
    }
  }

  static Future<bool> AddPosts() async {
    var client = http.Client();

    try {
      var response = await client
          .post(Uri.parse('https://jsonplaceholder.typicode.com/posts'), body: {
        'title': 'foo',
        'body': 'bar',
        'userId': "34",
      });
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString() as num);
      return false;
    }
  }
}
