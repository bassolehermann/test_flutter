import 'package:flutter/cupertino.dart';

class AppUtils {
  static height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static widht(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
