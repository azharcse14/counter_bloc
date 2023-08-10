part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

class IncreaseEvent extends CounterEvent{
  @override
  List<Object?> get props => [];
}

class DecreaseEvent extends CounterEvent{
  @override
  List<Object?> get props => [];
}