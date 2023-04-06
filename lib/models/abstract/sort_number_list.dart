// Dart imports:
import 'dart:collection';

abstract class SortNumberList<T extends List<U>, U> extends ListBase<U> {
  SortNumberList();

  late List<U> numbers;

  SortNumberList.from(this.numbers);

  @override
  get length => numbers.length;

  @override
  set length(int newLength) {
    numbers.length = newLength;
  }

  @override
  U operator [](int index) => numbers[index];

  @override
  void operator []=(int index, U value) {
    numbers[index] = value;
  }
}
