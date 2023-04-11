// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:flutter_sort/models/quick_sort/quick_sort_number.dart';
import 'package:flutter_sort/models/quick_sort/quick_sort_number_list.dart';
import 'package:flutter_sort/providers/abstract/sort_provider.dart';

class QuickSortNotifier
    extends SortNotifier<QuickSortNumberList, QuickSortNumber> {
  QuickSortNotifier() : super();

  @override
  QuickSortNumber fromNumber(int value) {
    return QuickSortNumber.from(value);
  }

  @override
  QuickSortNumberList fromNumberList(List<QuickSortNumber> list) {
    return QuickSortNumberList.from(list);
  }

  @override
  Future<void> processing() async {
    int low = 0;
    int high = numbers.length - 1;
    await quickSort(numbers, low, high);
    for (var i = 0; i < numbers.length; i++) {
      numbers[i].fixed = true;
      notifyListeners();
      await Future.delayed(const Duration(milliseconds: 10));
    }
  }

  Future<void> quickSort(QuickSortNumberList arr, int low, int high) async {
    if (low < high) {
      int pivotIndex = await partition(arr, low, high);
      await quickSort(arr, low, pivotIndex - 1);
      await quickSort(arr, pivotIndex + 1, high);
    }
  }

  Future<int> partition(QuickSortNumberList arr, int low, int high) async {
    QuickSortNumber pivot = arr[high];
    pivot.current = true;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 10));

    int i = low - 1;

    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 10));

    for (int j = low; j < high; j++) {
      final now = arr[j];
      now.check = true;
      notifyListeners();
      await Future.delayed(const Duration(milliseconds: 10));

      if (arr[j].value <= pivot.value) {
        i++;
        swap(arr, i, j);
        notifyListeners();
        await Future.delayed(const Duration(milliseconds: 10));
      }
      now.check = false;
      notifyListeners();
      await Future.delayed(const Duration(milliseconds: 10));
    }

    swap(arr, i + 1, high);
    pivot.current = false;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 10));
    return i + 1;
  }

  void swap(QuickSortNumberList arr, int i, int j) {
    QuickSortNumber temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }
}

final quickSortProvider = ChangeNotifierProvider<QuickSortNotifier>((ref) {
  return QuickSortNotifier();
});
