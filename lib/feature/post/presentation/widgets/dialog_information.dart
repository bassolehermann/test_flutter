import 'package:flutter/material.dart';

showDialogInformation(BuildContext context,String message){
  return showDialog(
    context: context,
    builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Information"),
          content: Text("$message"),
          actions: <Widget>[
            TextButton(
              child:Text("Fermer",),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      }
  );
}