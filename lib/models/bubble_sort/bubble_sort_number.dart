// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_sort/models/abstract/sort_number.dart';

class BubbleSortNumber extends SortNumber<BubbleSortNumber> {
  BubbleSortNumber() : super();

  BubbleSortNumber.from(int numbers) : super.from(numbers);

  // この数字がどのような状態かを示すフラグ
  bool check = false; // チェック中
  bool current = false; // 現在の軸としている数字がどうか
  bool fixed = false; // 確定済みかどうか
  bool candidate = false; // 候補かどうか

  // この数字がどのような状態かによって色を変える
  Color get color {
    if (fixed) {
      return Colors.blue;
    } else if (candidate) {
      return Colors.orange;
    } else if (check) {
      return Colors.red;
    } else if (current) {
      return Colors.yellow;
    }
    return Colors.green;
  }
}
