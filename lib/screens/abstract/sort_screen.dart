// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:flutter_sort/models/abstract/sort_number.dart';

abstract class SortScreen<T extends SortNumber> extends ConsumerWidget {
  const SortScreen({Key? key}) : super(key: key);
  final double margin = 1;

  Future<void> sort(ref);

  Widget buildBar(constraints, T number, int length) {
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
}
