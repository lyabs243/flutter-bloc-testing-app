import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure/utils/constants.dart';
import 'package:flutter_structure/utils/enums.dart';
import 'package:flutter_structure/logic/states/game_state.dart';
import 'dart:math';

class GameCubit extends Cubit<GameState> {

  final _random = new Random();

  GameCubit() : super(GameState()) {
    initHiddenNumber();
  }

  initHiddenNumber() {
    emit(GameState(gameStatus: GameStatus.loading));
    int hiddenNumber = MIN_GAME_NUMBER + _random.nextInt(MAX_GAME_NUMBER - MIN_GAME_NUMBER);
    emit(GameState(gameStatus: GameStatus.playing, hiddenNumber: hiddenNumber));
  }

  checkNumber(String textNumber) {
    if (textNumber.isNotEmpty) {
      emit(GameState(gameStatus: GameStatus.loading, hiddenNumber: state.hiddenNumber, lives: state.lives));

      int number = -1;
      try {
        number = int.parse(textNumber);
      }
      catch(e) {}

      GameStatus _gameStatus;
      int lives = state.lives;
      if (number > state.hiddenNumber) {
        _gameStatus = GameStatus.smaller;
        lives--;
      }
      else if (number < state.hiddenNumber) {
        _gameStatus = GameStatus.greater;
        lives--;
      }
      else {
        _gameStatus = GameStatus.success;
      }

      //if user lives, finishes, game over
      if (lives <= 0) {
        _gameStatus = GameStatus.failed;
      }

      emit(GameState(gameStatus: _gameStatus, hiddenNumber: state.hiddenNumber, lives: lives));
    }
  }

}