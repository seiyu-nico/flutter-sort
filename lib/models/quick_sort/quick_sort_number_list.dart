// Project imports:
import 'package:flutter_sort/models/abstract/sort_number_list.dart';
import 'package:flutter_sort/models/quick_sort/quick_sort_number.dart';

class QuickSortNumberList
    extends SortNumberList<QuickSortNumberList, QuickSortNumber> {
  QuickSortNumberList() : super();

  QuickSortNumberList.from(List<QuickSortNumber> numbers) : super.from(numbers);
}
