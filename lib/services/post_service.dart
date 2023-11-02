import 'dart:convert';

import 'package:ppb_tutorial_3/models/post.dart';

import 'package:http/http.dart' as http;

class PostService {
  static Future<List<Post>> ListPosts() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if(response.statusCode ==200){
      final List<dynamic> posts = jsonDecode(response.body);
    // return posts.map((p)=>Post.fromJson(p)).toList();
    return [...posts.map((p) => Post.fromJson(p))];
    }else{
      throw Exception('Gagal memuat daftar post');
    }
  }
}