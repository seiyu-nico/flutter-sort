// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:flutter_sort/models/insertion_sort/insertion_sort_number.dart';
import 'package:flutter_sort/providers/insertion_sort_provider.dart';
import 'package:flutter_sort/screens/abstract/sort_screen.dart';

class InsertionSortScreen extends SortScreen<InsertionSortNumber> {
  const InsertionSortScreen({Key? key}) : super(key: key);

  @override
  Future<void> sort(ref) async {
    await ref.read(insertionSortProvider).sort();
  }

  @override
  void reset(ref) {
    ref.read(insertionSortProvider).reset();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final insertionSortNotifier = ref.watch(insertionSortProvider);
    final int numberLength = insertionSortNotifier.numbers.length;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: insertionSortNotifier.numbers
              .map((number) => buildBar(constraints, number, numberLength))
              .toList(),
        );
      },
    );
  }
}
