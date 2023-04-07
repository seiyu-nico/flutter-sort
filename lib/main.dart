// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:flutter_sort/providers/sort_types_provider.dart';

// Project imports:

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Selection Sort')),
        body: const Home(),
      ),
    );
  }
}

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortTypes = ref.watch(sortTypesProvider);

    return Column(
      children: [
        const SizedBox(height: 20),
        Expanded(
          child: sortTypes.screen,
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<int>(
                value: sortTypes.selected,
                items: sortTypes.types.map<DropdownMenuItem<int>>((type) {
                  return DropdownMenuItem<int>(
                    value: type['id'],
                    child: Text(type['text']),
                  );
                }).toList(),
                onChanged: (value) {
                  sortTypes.type = value!;
                },
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () async {
                  await sortTypes.sort(ref);
                },
                child: const Text('Sort'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
