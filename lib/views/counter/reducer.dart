import 'package:get_it/get_it.dart';
import 'state.dart';
/// Business logic only with pure functions to change the memory state

final state = GetIt.instance<CounterState>();


void initCounterState() {
  state.initialize();
}

void add() {
  int value = state.value;
  int newSate = value + 1;
  state.apply(newSate);
}

