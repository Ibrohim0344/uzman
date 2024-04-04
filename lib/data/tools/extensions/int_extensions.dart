import 'package:flutter/material.dart';

extension Gap on int {
  SizedBox gapY() => SizedBox(height: toDouble());

  SizedBox gapX() => SizedBox(width: toDouble());
}
