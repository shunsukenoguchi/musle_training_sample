import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:muscle_training/model/coutner/counter.dart';
import 'package:muscle_training/view_model/counter/coutner_view_model.dart';

class CoutnerPage extends HookConsumerWidget {
  const CoutnerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Counter countner = ref.watch(counterProvider);
    final counterNotifier = ref.watch(counterProvider.notifier);

    void increment() {
      counterNotifier.increment();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              countner.count.toString(),
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
