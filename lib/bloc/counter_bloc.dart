import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int count = 0;

  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      emit(UpdateCounter(count: count));
    });

    on<IncreaseEvent>((event, emit) {
      count++;
      emit(UpdateCounter(count: count));
    });

    on<DecreaseEvent>((event, emit) {
      count--;
      emit(UpdateCounter(count: count));
    });
  }


}
