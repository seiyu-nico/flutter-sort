// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:flutter_sort/models/quick_sort/quick_sort_number.dart';
import 'package:flutter_sort/providers/quick_sort_provider.dart';
import 'package:flutter_sort/screens/abstract/sort_screen.dart';

class QuickSortScreen extends SortScreen<QuickSortNumber> {
  const QuickSortScreen({Key? key}) : super(key: key);

  @override
  Future<void> sort(ref) async {
    await ref.read(quickSortProvider).sort();
  }

  @override
  void reset(ref) {
    ref.read(quickSortProvider).reset();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quickSortNotifier = ref.watch(quickSortProvider);
    final int numberLength = quickSortNotifier.numbers.length;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: quickSortNotifier.numbers
              .map((number) => buildBar(constraints, number, numberLength))
              .toList(),
        );
      },
    );
  }
}
