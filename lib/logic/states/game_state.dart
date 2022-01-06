import 'package:flutter_structure/utils/constants.dart';
import 'package:flutter_structure/utils/enums.dart';

class GameState {

  int hiddenNumber, lives;
  GameStatus gameStatus;

  GameState({this.gameStatus: GameStatus.playing, this.hiddenNumber: -1, this.lives: TOTAL_LIVES});

}