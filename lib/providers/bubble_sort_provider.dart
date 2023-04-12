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

  int now = 0;

  @override
  Future<void> sort() async {
    final length = numbers.length;
    for (int i = 0; i < length - 1; i++) {
      for (int j = 0; j < length - 1 - i; j++) {
        numbers[j].current = true;
        numbers[j + 1].check = true;
        notifyListeners();
        await Future.delayed(const Duration(milliseconds: 10));

        if (numbers[j].value > numbers[j + 1].value) {
          numbers[j].current = false;
          numbers[j + 1].check = false;

          final temp = numbers[j];
          numbers[j] = numbers[j + 1];
          numbers[j + 1] = temp;

          numbers[j + 1].current = true;
          numbers[j].check = false;
          numbers[j].current = false;
        } else {
          numbers[j + 1].check = false;
          numbers[j + 1].current = true;
          numbers[j].current = false;
        }

        notifyListeners();
        await Future.delayed(const Duration(milliseconds: 10));
      }
      numbers[length - 1 - i].fixed = true;

      notifyListeners();
    }
    for (int i = 0; i < length; i++) {
      numbers[i].fixed = true;
      notifyListeners();
      await Future.delayed(const Duration(milliseconds: 10));
    }
  }
}

final bubbleSortProvider = ChangeNotifierProvider<BubbleSortNotifier>((ref) {
  return BubbleSortNotifier();
});
