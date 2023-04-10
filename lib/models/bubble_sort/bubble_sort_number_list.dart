// Project imports:
import 'package:flutter_sort/models/abstract/sort_number_list.dart';
import 'package:flutter_sort/models/bubble_sort/bubble_sort_number.dart';

class BubbleSortNumberList
    extends SortNumberList<BubbleSortNumberList, BubbleSortNumber> {
  BubbleSortNumberList() : super();

  BubbleSortNumberList.from(List<BubbleSortNumber> numbers)
      : super.from(numbers);
}
