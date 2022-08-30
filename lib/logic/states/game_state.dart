import 'package:flutter_structure/logic/responses/game_response.dart';
import 'package:flutter_structure/utils/my_material.dart';

class GameState {

  bool isLoading;
  int hiddenNumber, lives;

  GameResponse? response;
  TextEditingController numberEditingController = TextEditingController();

  GameState({this.isLoading = true, this.hiddenNumber = -1, this.lives = totalLives, this.response});

  GameState copy() {
    GameState copy = GameState(isLoading: isLoading, hiddenNumber: hiddenNumber, lives: lives,
      response: response);

    copy.numberEditingController = numberEditingController;

    return copy;
  }

  String get circleText {

    if (! (response?.code == GameResponseCode.failed || response?.code == GameResponseCode.success)) {
      return '?';
    }

    return '$hiddenNumber';
  }

  String buttonText(BuildContext context) {

    if (! (response?.code == GameResponseCode.failed || response?.code == GameResponseCode.success)) {
      return AppLocalizations.of(context)!.ok;
    }

    return AppLocalizations.of(context)!.replay;
  }
}