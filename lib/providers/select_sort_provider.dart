// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:flutter_sort/models/select_sort/select_sort_number.dart';
import 'package:flutter_sort/models/select_sort/select_sort_number_list.dart';

class SelectSortNotifier extends ChangeNotifier {
  SelectSortNotifier(this.numbers);

  // ソート対象の数字のリスト
  SelectSortNumberList numbers;

  // ソートを実行する
  Future<void> selectionSort() async {
    int n = numbers.length;
    for (int i = 0; i < n; i++) {
      int minIndex = i;
      numbers[i].current = true;
      notifyListeners();
      for (int j = i + 1; j < n; j++) {
        numbers[j].check = true;
        notifyListeners();
        await Future.delayed(const Duration(milliseconds: 100));

        if (numbers[j].value < numbers[minIndex].value) {
          numbers[j].candidate = true;
          numbers[minIndex].candidate = false;
          minIndex = j;
        }
        numbers[j].check = false;
        notifyListeners();
        await Future.delayed(const Duration(milliseconds: 100));
      }

      numbers[i].current = false;
      numbers[minIndex].fixed = true;
      numbers[minIndex].candidate = false;
      if (minIndex != i) {
        await Future.delayed(const Duration(milliseconds: 100));
        numbers.swap(i, minIndex);
      }
      notifyListeners();
    }
  }
}

final selectSortProvider = ChangeNotifierProvider<SelectSortNotifier>((ref) {
  SelectSortNumberList numbers = SelectSortNumberList([
    SelectSortNumber(5),
    SelectSortNumber(3),
    SelectSortNumber(8),
    SelectSortNumber(4),
    SelectSortNumber(1),
    SelectSortNumber(10),
    SelectSortNumber(9),
    SelectSortNumber(7),
    SelectSortNumber(2),
    SelectSortNumber(6),
  ]);
  return SelectSortNotifier(numbers);
});
