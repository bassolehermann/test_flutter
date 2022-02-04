import 'package:equatable/equatable.dart';
import 'package:flutter_test_entretient/feature/post/data/models/post_data.dart';

class Post extends Equatable{
    int? userId;
    int? id;
    String? title;
    String? body;
  Post({
        this.userId,
        this.id,
       required this.title,
       required this.body,
    });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}