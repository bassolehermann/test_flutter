import 'package:flutter/material.dart';
import 'package:flutter_test_entretient/core/constant/app_constant.dart';
import 'package:flutter_test_entretient/feature/post/data/models/post_data.dart';
import 'package:flutter_test_entretient/feature/post/data/repositories/post_data_source_implement.dart';
import 'package:flutter_test_entretient/feature/post/domaine/entities/post.dart';
import 'package:flutter_test_entretient/feature/post/presentation/screens/detail_screen.dart';
import 'package:flutter_test_entretient/feature/post/presentation/widgets/dialog_information.dart';
import 'package:flutter_test_entretient/feature/post/presentation/widgets/item_post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerBody = TextEditingController();

  PostDataSourceImplement postDataSource = PostDataSourceImplement();
  List<PostData> listPost = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.appName),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controllerTitle,
            decoration: InputDecoration(
              hintText: "title"
            ),
          ),
          TextField(
            controller: _controllerBody,
            decoration: InputDecoration(
              hintText: "body"
            ),
          ),
          Expanded(
              child: FutureBuilder<List<PostData>>(
            future: postDataSource.getAllPost(),
            builder: (context, snapShot) {
              if (snapShot.connectionState == ConnectionState.done) {
                listPost = snapShot.data!;
                if (snapShot.hasData) {
                  return ListView.builder(
                      itemCount: listPost.length,
                      itemBuilder: (context, index) {
                        return ItemPost(
                          title: listPost[index].title,
                          onTapDetail: () => onPressDetail(
                              title: listPost[index].title!,
                              body: listPost[index].body),
                          onPressedDelete: () => onPressedDelete(),
                        );
                      });
                } else {
                  return CircularProgressIndicator();
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: onPressAddPost,
      ),
    );
  }

  onPressDetail({required String title, required body}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => DetailScreen(title: title, body: body)));
  }

  void onPressAddPost() async{
    if (_controllerTitle.text.isEmpty) {
      showDialogInformation(
          context, "Veuillez remplir le champ avant cliquer sur le bouton");
    }else{
      PostData newPostData = PostData(title:_controllerTitle.text, body: _controllerBody.text);
      listPost = await postDataSource.addNewPost(newPostData);
      setState(() {});
    }
  }

  void onPressedDelete() {}
}
