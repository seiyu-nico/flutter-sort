// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:flutter_sort/screens/bubble_sort_screen.dart';
import 'package:flutter_sort/screens/select_sort_screen.dart';

class SortTypesNotifier extends ChangeNotifier {
  SortTypesNotifier() : super();

  final _types = [
    {'id': 0, 'text': '選択ソート', 'screen': const SelectSortScreen()},
    {'id': 1, 'text': 'バブルソート', 'screen': const BubbleSortScreen()},
  ];

  int selected = 0;

  get types => _types;

  set type(int value) {
    selected = types.firstWhere((type) => type['id'] == value)['id'];
    notifyListeners();
  }

  get screen => types[selected]['screen'];

  Future<void> sort(ref) async {
    types[selected]['screen'].sort(ref);
  }
}

final sortTypesProvider = ChangeNotifierProvider<SortTypesNotifier>((ref) {
  return SortTypesNotifier();
});
