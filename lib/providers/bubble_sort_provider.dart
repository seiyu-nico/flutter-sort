// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:flutter_sort/models/bubble_sort/bubble_sort_number.dart';
import 'package:flutter_sort/models/bubble_sort/bubble_sort_number_list.dart';
import 'package:flutter_sort/providers/abstract/sort_provider.dart';

class BubbleSortNotifier
    extends SortNotifier<BubbleSortNumberList, BubbleSortNumber> {
  BubbleSortNotifier() : super();

  @override
  BubbleSortNumber fromNumber(int value) {
    return BubbleSortNumber.from(value);
  }

  @override
  BubbleSortNumberList fromNumberList(List<BubbleSortNumber> list) {
    return BubbleSortNumberList.from(list);
  }

  // ソートを実行する
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

final bubbleSortProvider = ChangeNotifierProvider<BubbleSortNotifier>((ref) {
  return BubbleSortNotifier();
});
