import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/increment_counter.dart';
import '../../domain/usecases/decrement_counter.dart';

class CounterCubit extends Cubit<int> {
  final IncrementCounter incrementCounter;
  final DecrementCounter decrementCounter;

  CounterCubit({
    required this.incrementCounter,
    required this.decrementCounter,
  }) : super(0);

  void increment() {
    emit(incrementCounter());
  }

  void decrement() {
    emit(decrementCounter());
  }
}
