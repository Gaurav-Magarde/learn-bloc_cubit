import 'package:flutter_bloc/flutter_bloc.dart';

sealed class CounterEvent{}
final class IncrementCounter extends CounterEvent{}
final class DecrementCounter extends CounterEvent{}
class BlocCounter extends Bloc<CounterEvent,int>{
  BlocCounter():super(0){
    on<IncrementCounter>((event,emit){
      emit(state + 1);
    });
    on<DecrementCounter>((event,emit){
      emit(state - 1);
    });
  }
}