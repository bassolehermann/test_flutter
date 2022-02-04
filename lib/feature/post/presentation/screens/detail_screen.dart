import 'package:flutter/material.dart';
class DetailScreen extends StatefulWidget {
  final String title;
  final String body;
  const DetailScreen({ Key? key, required this.title, required this.body }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("${widget.title}"),
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left:20.0,right: 20,top: 30),
          child: Container(
            child: Text(("${widget.body}}")),
            
          ),
        ),
      ),
      
    );
  }
}