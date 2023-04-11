// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:flutter_sort/models/select_sort/select_sort_number.dart';
import 'package:flutter_sort/models/select_sort/select_sort_number_list.dart';
import 'package:flutter_sort/providers/abstract/sort_provider.dart';

class SelectSortNotifier
    extends SortNotifier<SelectSortNumberList, SelectSortNumber> {
  SelectSortNotifier() : super();

  @override
  SelectSortNumber fromNumber(int value) {
    return SelectSortNumber.from(value);
  }

  @override
  SelectSortNumberList fromNumberList(List<SelectSortNumber> list) {
    return SelectSortNumberList.from(list);
  }

  @override
  Future<void> processing() async {
    int n = numbers.length;
    for (int i = 0; i < n; i++) {
      int minIndex = i;
      numbers[i].current = true;
      notifyListeners();
      for (int j = i + 1; j < n; j++) {
        numbers[j].check = true;
        notifyListeners();
        await Future.delayed(const Duration(milliseconds: 10));

        if (numbers[j].value < numbers[minIndex].value) {
          numbers[j].candidate = true;
          numbers[minIndex].candidate = false;
          minIndex = j;
        }
        numbers[j].check = false;
        notifyListeners();
        await Future.delayed(const Duration(milliseconds: 10));
      }

      numbers[i].current = false;
      numbers[minIndex].fixed = true;
      numbers[minIndex].candidate = false;
      if (minIndex != i) {
        await Future.delayed(const Duration(milliseconds: 10));
        numbers.swap(i, minIndex);
      }
      notifyListeners();
    }
  }
}

final selectSortProvider = ChangeNotifierProvider<SelectSortNotifier>((ref) {
  return SelectSortNotifier();
});
