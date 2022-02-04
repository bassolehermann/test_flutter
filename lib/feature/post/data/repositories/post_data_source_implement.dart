

import 'package:flutter_test_entretient/core/error/exceptions.dart';
import 'package:flutter_test_entretient/feature/post/data/datasources/post_data_source.dart';
import 'package:flutter_test_entretient/feature/post/data/models/post_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class PostDataSourceImplement extends PostDataSource{
  @override
  Future<List<PostData>> getAllPost() async{
    final response = await http.Client().get(Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
     List<PostData> postList =  postFromJson(response.body);
      return postList;
    } else {
      throw ServerException("Failed to load post",response.statusCode,"");
    }
  }

  @override
  Future<List<PostData>> addNewPost(PostData body) async{
    final response = await http.Client().post(Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      /* headers: {
        'Content-Type': 'application/json',
      }, */
      body: body.toJson()
    );
    if (response.statusCode == 201) {
     List<PostData> postList = postFromJson(response.body);
      return postList;
    } else {
      print("===>${response.statusCode}");
      throw ServerException("Failed to add post",response.statusCode,"");
    }
  }

  @override
  Future<List<PostData>> deletPost(String id) {
    // TODO: implement deletPost
    throw UnimplementedError();
  }

  

  @override
  Future<List<PostData>> updatePost(String id,PostData post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
  
}