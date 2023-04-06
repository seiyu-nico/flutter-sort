// Project imports:
import 'package:flutter_sort/models/abstract/sort_number_list.dart';
import 'package:flutter_sort/models/select_sort/select_sort_number.dart';

class SelectSortNumberList
    extends SortNumberList<SelectSortNumberList, SelectSortNumber> {
  SelectSortNumberList() : super();

  SelectSortNumberList.from(List<SelectSortNumber> numbers)
      : super.from(numbers);

  // 2つの数字を入れ替える
  swap(int i, int j) {
    SelectSortNumber temp = numbers[i];
    numbers[i] = numbers[j];
    numbers[j] = temp;
  }
}
