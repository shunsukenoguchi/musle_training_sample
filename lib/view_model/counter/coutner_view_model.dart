import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muscle_training/model/coutner/counter.dart';

final counterProvider = StateNotifierProvider<CoutnerNotifier, Counter>((ref) {
  return CoutnerNotifier();
});

class CoutnerNotifier extends StateNotifier<Counter> {
  CoutnerNotifier() : super(const Counter());

  void increment() {
    state = state.copyWith(count: state.count + 1);
  }
}
