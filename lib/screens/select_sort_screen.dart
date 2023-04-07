// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:flutter_sort/models/select_sort/select_sort_number.dart';
import 'package:flutter_sort/providers/select_sort_provider.dart';

class SelectSortScreen extends ConsumerWidget {
  const SelectSortScreen({Key? key}) : super(key: key);

  final double margin = 1;

  Widget buildBar(constraints, SelectSortNumber number, int length) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.symmetric(horizontal: margin),
      width: (constraints.maxWidth - (length * margin * 2)) / length,
      height: (constraints.maxHeight / length) * number.value,
      color: number.color,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 1),
        child: Text(
          number.value.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectSortNotifier = ref.watch(selectSortProvider);
    final int numberLength = selectSortNotifier.numbers.length;
    return Column(
      children: [
        const SizedBox(height: 20),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: selectSortNotifier.numbers
                    .map(
                        (number) => buildBar(constraints, number, numberLength))
                    .toList(),
              );
            },
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
