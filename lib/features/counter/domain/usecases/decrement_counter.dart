import '../repositories/counter_repository.dart';

class DecrementCounter {
  final CounterRepository repository;

  DecrementCounter(this.repository);

  int call() {
    return repository.decrement();
  }
}
