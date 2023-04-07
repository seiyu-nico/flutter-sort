// Project imports:
import 'package:flutter_sort/models/abstract/sort_number_list.dart';
import 'package:flutter_sort/models/insertion_sort/insertion_sort_number.dart';

class InsertionSortNumberList
    extends SortNumberList<InsertionSortNumberList, InsertionSortNumber> {
  InsertionSortNumberList() : super();

  InsertionSortNumberList.from(List<InsertionSortNumber> numbers)
      : super.from(numbers);
}
