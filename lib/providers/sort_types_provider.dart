// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:flutter_sort/screens/bubble_sort_screen.dart';
import 'package:flutter_sort/screens/insertion_sort_screen.dart';
import 'package:flutter_sort/screens/quick_sort_screen.dart';
import 'package:flutter_sort/screens/select_sort_screen.dart';

class SortTypesNotifier extends ChangeNotifier {
  SortTypesNotifier() : super();

  final _types = [
    {'id': 0, 'text': '選択ソート', 'screen': const SelectSortScreen()},
    {'id': 1, 'text': '挿入ソート', 'screen': const InsertionSortScreen()},
    {'id': 2, 'text': 'バブルソート', 'screen': const BubbleSortScreen()},
    {'id': 3, 'text': 'クイックソート', 'screen': const QuickSortScreen()},
  ];

  int selected = 0;

  bool _run = false;

  get types => _types;

  set type(int value) {
    selected = types.firstWhere((type) => type['id'] == value)['id'];
    notifyListeners();
  }

  get screen => types[selected]['screen'];

  set run(state) {
    print('ここha?');
    _run = state;
    notifyListeners();
  }

  get run => _run;
}

final sortTypesProvider = ChangeNotifierProvider<SortTypesNotifier>((ref) {
  return SortTypesNotifier();
});
