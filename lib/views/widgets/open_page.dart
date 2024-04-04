import 'package:flutter/cupertino.dart';

void getTo(context, Widget page) {
  Navigator.of(context).push(
    CupertinoPageRoute(builder: (context) => page),
  );
}
