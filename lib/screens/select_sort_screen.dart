// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:flutter_sort/models/select_sort/select_sort_number.dart';
import 'package:flutter_sort/providers/select_sort_provider.dart';
import 'package:flutter_sort/screens/abstract/sort_screen.dart';

class SelectSortScreen extends SortScreen<SelectSortNumber> {
  const SelectSortScreen({Key? key}) : super(key: key);

  @override
  void sort(ref) {
    ref.read(selectSortProvider).sort();
  }

  @override
  void reset(ref) {
    ref.read(selectSortProvider).reset();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectSortNotifier = ref.watch(selectSortProvider);
    final int numberLength = selectSortNotifier.numbers.length;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: selectSortNotifier.numbers
              .map((number) => buildBar(constraints, number, numberLength))
              .toList(),
        );
      },
    );
  }
}
