import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure/logic/responses/game_response.dart';
import 'package:flutter_structure/logic/states/game_state.dart';
import 'dart:math';
import 'package:flutter_structure/utils/my_material.dart';

class GameCubit extends Cubit<GameState> {

  final _random = Random();

  GameCubit() : super(GameState()) {
    initHiddenNumber();
  }

  showMessage(GameResponseCode code, {messageType = MessageType.dialog}) async {
    state.isLoading = false;
    state.response = GameResponse(
      code: code,
      messageType: messageType,
    );
    emit(state.copy());
  }

  initHiddenNumber() {
    state.isLoading = true;
    state.response = null;
    state.lives = totalLives;
    state.numberEditingController.clear();
    emit(state.copy());

    state.hiddenNumber = minGameNumber + _random.nextInt(maxGAMENumber - minGameNumber);

    state.isLoading = false;
    emit(state.copy());
  }

  checkNumber() {
    String textNumber = state.numberEditingController.text;
    if (textNumber.isNotEmpty && ! (state.response?.code == GameResponseCode.success || state.response?.code == GameResponseCode.failed)) {
      state.isLoading = true;
      emit(state.copy());

      int number = -1;
      try {
        number = int.parse(textNumber);
      }
      catch(e) {
        debugPrint('=============Failed to parse number: $e');
      }

      GameResponseCode code;
      if (number > state.hiddenNumber) {
        code = GameResponseCode.smaller;
        state.lives--;
      }
      else if (number < state.hiddenNumber) {
        code = GameResponseCode.greater;
        state.lives--;
      }
      else {
        code = GameResponseCode.success;
      }

      //if user lives, finishes, game over
      if (state.lives <= 0) {
        code = GameResponseCode.failed;
      }

      showMessage(code, messageType: MessageType.dialog);
    }
  }

}