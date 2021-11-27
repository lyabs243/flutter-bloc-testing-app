import 'package:flutter_structure/constants/constants.dart';
import 'package:flutter_structure/constants/enums.dart';

class GameState {

  int hiddenNumber, lives;
  GameStatus gameStatus;

  GameState({this.gameStatus: GameStatus.playing, this.hiddenNumber: -1, this.lives: TOTAL_LIVES});

}