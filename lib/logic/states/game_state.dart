import 'package:flutter_structure/utils/my_material.dart';

class GameState {

  int hiddenNumber, lives;
  GameStatus gameStatus;

  GameState({this.gameStatus = GameStatus.playing, this.hiddenNumber = -1, this.lives = totalLives});

}