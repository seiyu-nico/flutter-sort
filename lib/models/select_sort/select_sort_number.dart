// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_sort/models/abstract/sort_number.dart';

class SelectSortNumber extends SortNumber {
  SelectSortNumber(value) : super(value);

  // この数字がどのような状態かを示すフラグ
  bool check = false; // チェック中
  bool current = false; // 現在の軸としている数字がどうか
  bool fixed = false; // 確定済みかどうか
  bool candidate = false; // 最小値の候補かどうか

  // この数字がどのような状態かによって色を変える
  Color get color {
    if (current) {
      return Colors.yellow;
    } else if (candidate) {
      return Colors.orange;
    } else if (check) {
      return Colors.red;
    } else if (fixed) {
      return Colors.blue;
    }
    return Colors.green;
  }
}
