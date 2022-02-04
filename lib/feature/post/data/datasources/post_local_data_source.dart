import 'dart:convert';

import 'package:flutter_test_entretient/core/error/exceptions.dart';
import 'package:flutter_test_entretient/feature/post/data/models/post_data.dart';
import 'package:flutter_test_entretient/feature/post/domaine/entities/post.dart';
import 'package:shared_preferences/shared_preferences.dart';
const CACHED_POST = 'CACHED_NUMBER_TRIVIA';
abstract class PostLocalDataSource{
  Future<List<PostData>>? getLastLisPost();
  Future<void> cacheListPost(List<PostData>listPost);
}
