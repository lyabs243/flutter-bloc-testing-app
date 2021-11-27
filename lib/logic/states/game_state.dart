import 'package:flutter_structure/constants/enums.dart';

class GameState {

  int hiddenNumber;
  GameStatus gameStatus;

  GameState({this.gameStatus: GameStatus.playing, this.hiddenNumber: -1});

}