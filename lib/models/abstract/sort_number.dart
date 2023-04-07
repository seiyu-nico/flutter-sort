// Flutter imports:
import 'package:flutter/material.dart';

abstract class SortNumber<T> {
  late int value;

  SortNumber();

  SortNumber.from(this.value);

  Color get color;
}
