// Flutter imports:
import 'package:flutter/material.dart';

abstract class SortNotifier<T extends List<U>, U> extends ChangeNotifier {
  SortNotifier() {
    numbers = generateNumbers();
  }

  bool run = false;

  // ソート対象の数字のリスト
  late T numbers;

  U fromNumber(int value);

  T fromNumberList(List<U> list);

  Future<void> processing();

  Future<void> sort() async {
    if (run) return;
    run = true;
    await processing();
    run = false;
  }

  T generateNumbers() {
    final list =
        List<U>.generate(50, (index) => fromNumber(index + 1)).toList();
    list.shuffle();
    return fromNumberList(list);
  }

  void reset() {
    numbers = generateNumbers();
  }
}
