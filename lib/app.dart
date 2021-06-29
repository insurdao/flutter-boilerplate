import 'package:get_it/get_it.dart';
import 'package:insur/views/counter/state.dart';


final GetIt getIt = GetIt.instance;

/// initialize all pages with their effects and reducers
void init() {
  getIt.registerLazySingleton<CounterState> (() => CounterState());
}
