import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure/logic/states/time_state.dart';

class TimeCubit extends Cubit<TimeState> {

  Timer? timer;

  TimeCubit() : super(TimeState(DateTime.now())) {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => emit(TimeState(DateTime.now())));
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }

}