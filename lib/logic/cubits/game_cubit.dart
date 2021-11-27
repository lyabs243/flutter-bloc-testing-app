import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure/constants/constants.dart';
import 'package:flutter_structure/constants/enums.dart';
import 'package:flutter_structure/logic/states/game_state.dart';
import 'dart:math';

class GameCubit extends Cubit<GameState> {

  final _random = new Random();

  GameCubit() : super(GameState()) {
    initHiddenNumber();
  }

  initHiddenNumber() {
    emit(GameState(gameStatus: GameStatus.loading));
    state.hiddenNumber = MIN_GAME_NUMBER + _random.nextInt(MAX_GAME_NUMBER - MIN_GAME_NUMBER);
    state.gameStatus = GameStatus.playing;
    emit(state);
  }

}