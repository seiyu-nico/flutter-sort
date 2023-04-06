// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:flutter_sort/screens/select_sort_screen.dart';

// Project imports:

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Selection Sort')),
        // 現状セレクトソートしか存在しないのでセレクトソートの画面を表示する
        body: const SelectSortScreen(),
      ),
    );
  }
}
