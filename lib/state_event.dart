import 'package:bmiusingbloc/staeLogic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

sealed class bmiEvent {}

class updateWeight extends bmiEvent {
  double weight;
  updateWeight({required this.weight});
}

class updateHeight extends bmiEvent {
  double height;
  updateHeight({required this.height});
}

class CalculateEvent extends bmiEvent {}

class BlocState extends Bloc<bmiEvent, StateLogic> {
  double w = 0.0;
  double h = 0.0;
  BlocState() : super(StateLogic(weight: 0.0, height: 0.0, bmi: 0.0)) {
    on<updateHeight>(
      (event, emit) {
        h = event.height / 100;
        // emit(state.copyWith(h: event.height));
      },
    );
    on<updateWeight>(
      (event, emit) {
        w = event.weight;
        //emit(state.copyWith(w: event.weight));
      },
    );
    on<CalculateEvent>((event, emit) {
      final bmi = w / (h * h);
      emit(state.copyWith(bmi: bmi));
    });
  }
}
