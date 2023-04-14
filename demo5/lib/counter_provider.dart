import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateNotifierProvider<CounterController, int>((ref) {
  return CounterController();
});

class CounterController extends StateNotifier<int> {
  CounterController() : super(0);

  // tang state
  tang(){
    state = state + 1;
  }
}
