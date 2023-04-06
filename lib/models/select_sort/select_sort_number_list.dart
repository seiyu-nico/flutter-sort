// Project imports:
import 'package:flutter_sort/models/abstract/sort_number.dart';
import 'package:flutter_sort/models/abstract/sort_number_list.dart';

class SelectSortNumberList extends SortNumberList {
  SelectSortNumberList(numbers) : super(numbers);

  // 2つの数字を入れ替える
  swap(int i, int j) {
    SortNumber temp = numbers[i];
    numbers[i] = numbers[j];
    numbers[j] = temp;
  }
}
