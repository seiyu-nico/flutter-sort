// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:flutter_sort/models/bubble_sort/bubble_sort_number.dart';
import 'package:flutter_sort/providers/bubble_sort_provider.dart';
import 'package:flutter_sort/screens/abstract/sort_screen.dart';

class BubbleSortScreen extends SortScreen<BubbleSortNumber> {
  const BubbleSortScreen({Key? key}) : super(key: key);

  @override
  Future<void> sort(ref) async {
    ref.read(bubbleSortProvider).sort();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bubbleSortNotifier = ref.watch(bubbleSortProvider);
    final int numberLength = bubbleSortNotifier.numbers.length;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: bubbleSortNotifier.numbers
              .map((number) => buildBar(constraints, number, numberLength))
              .toList(),
        );
      },
    );
  }
}
