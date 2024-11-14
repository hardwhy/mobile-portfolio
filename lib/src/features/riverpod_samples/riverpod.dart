import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'riverpod.g.dart';

@riverpod
String helloWorld(Ref ref) {
  return 'Hello Buzz';
}

@riverpod
class Counter extends _$Counter {
  @override
  int build() => 1;

  increment() => state += 1;
  decrement() => state -= 1;
}

class RiverpodSamples extends ConsumerWidget {
  const RiverpodSamples({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final helloWorld = ref.watch(helloWorldProvider);
    final state = ref.watch(counterProvider);
    final action = ref.watch(counterProvider.notifier);
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text('Riverpod samples'),
            Text(helloWorld),
            const SizedBox(height: 20),
            Text(
              '$state',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: action.decrement,
                  icon: const Icon(Icons.remove),
                  color: Colors.red[600],
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: action.increment,
                  icon: const Icon(Icons.add),
                  color: Colors.green[500],
                )
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => ref.refresh(counterProvider),
              child: const Text('Reset'),
            )
          ],
        ),
      ),
    );
  }
}
