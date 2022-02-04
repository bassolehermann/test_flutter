import 'package:flutter/material.dart';

class ItemPost extends StatelessWidget {
  final String? title;

  final Function() onTapDetail;

  final Function() onPressedDelete;

  const ItemPost(
      {Key? key,
      required this.title,
      required this.onTapDetail,
      required this.onPressedDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTapDetail,
          child: ListTile(
            title: Text("${title}"),
            trailing: IconButton(
                onPressed: onPressedDelete, icon: Icon(Icons.delete,color: Colors.red,)),
          ),
        ),
        Divider()
      ],
    );
  }
}
