// Dart imports:
import 'dart:collection';

// Project imports:
import 'package:flutter_sort/models/abstract/sort_number.dart';

abstract class SortNumberList<E> extends ListBase<E> {
  List<SortNumber> numbers;
  SortNumberList(this.numbers);

  @override
  get length => numbers.length;

  @override
  set length(int newLength) {
    numbers.length = newLength;
  }

  @override
  E operator [](int index) => numbers[index] as E;

  @override
  void operator []=(int index, E value) {
    numbers[index] = value as SortNumber;
  }
}
