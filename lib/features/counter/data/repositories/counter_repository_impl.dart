import '../../domain/repositories/counter_repository.dart';

class CounterRepositoryImpl implements CounterRepository {
  int _count = 0;

  @override
  int increment() {
    return ++_count;
  }

  @override
  int decrement() {
    return --_count;
  }
}
