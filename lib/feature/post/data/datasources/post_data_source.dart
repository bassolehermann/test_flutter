

import 'package:flutter_test_entretient/feature/post/data/models/post_data.dart';

abstract class PostDataSource{


  Future<List<PostData>> getAllPost();

  Future<List<PostData>> addNewPost(PostData body);

  Future<List<PostData>> updatePost(String id,PostData post);

  Future<List<PostData>> deletPost(String id);

}