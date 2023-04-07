// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:flutter_sort/models/insertion_sort/insertion_sort_number.dart';
import 'package:flutter_sort/models/insertion_sort/insertion_sort_number_list.dart';
import 'package:flutter_sort/providers/abstract/sort_provider.dart';

class InsertionSortNotifier
    extends SortNotifier<InsertionSortNumberList, InsertionSortNumber> {
  InsertionSortNotifier() : super();

  @override
  InsertionSortNumber fromNumber(int value) {
    return InsertionSortNumber.from(value);
  }

  @override
  InsertionSortNumberList fromNumberList(List<InsertionSortNumber> list) {
    return InsertionSortNumberList.from(list);
  }

  @override
  Future<void> sort() async {
    int length = numbers.length;
    for (var i = 1; i < length; i++) {
      var current = numbers[i];
      current.current = true;
      notifyListeners();
      await Future.delayed(const Duration(milliseconds: 10));

      var j = i - 1;

      while (j >= 0 && numbers[j].value > current.value) {
        numbers[j + 1] = numbers[j];
        j = j - 1;
        notifyListeners();
      }
      current.current = false;
      numbers[j + 1] = current;
      numbers[j + 1].candidate = true;
      notifyListeners();
    }
    for (var i = 0; i < length; i++) {
      numbers[i].fixed = true;
      notifyListeners();
      await Future.delayed(const Duration(milliseconds: 10));
    }
  }
}

final insertionSortProvider =
    ChangeNotifierProvider<InsertionSortNotifier>((ref) {
  return InsertionSortNotifier();
});
