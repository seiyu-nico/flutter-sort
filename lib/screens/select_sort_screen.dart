// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:flutter_sort/models/select_sort/select_sort_number.dart';
import 'package:flutter_sort/providers/select_sort_provider.dart';

class SelectSortScreen extends ConsumerWidget {
  const SelectSortScreen({Key? key}) : super(key: key);
  Widget buildBar(SelectSortNumber number) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: 20,
      height: number.value * 20.0,
      color: number.color,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectSortNotifier = ref.watch(selectSortProvider);

    return Column(
      children: [
        const SizedBox(height: 20),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: selectSortNotifier.numbers
                .map((number) => buildBar(number))
                .toList(),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            await selectSortNotifier.selectionSort();
          },
          child: const Text('Sort'),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
