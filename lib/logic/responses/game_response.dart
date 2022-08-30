import 'package:flutter_structure/data/models/response_code_item.dart';
import 'package:flutter_structure/utils/my_material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

enum GameResponseCode {failed, success, greater, smaller}

class GameResponse extends ResponseCodeItem {

  GameResponseCode code;

  GameResponse({required this.code, super.messageType = MessageType.toast});

  @override
  String message(BuildContext context) {
    switch (code) {
      case GameResponseCode.failed:
        return AppLocalizations.of(context)!.gameOver;
      case GameResponseCode.success:
        return AppLocalizations.of(context)!.congratulations;
      case GameResponseCode.greater:
        return AppLocalizations.of(context)!.greater;
      case GameResponseCode.smaller:
        return AppLocalizations.of(context)!.smaller;
    }
  }

  @override
  DialogType get type {
    switch (code) {
      case GameResponseCode.failed:
        return DialogType.error;
      case GameResponseCode.success:
        return DialogType.success;
      case GameResponseCode.greater:
      case GameResponseCode.smaller:
        return DialogType.info;
    }
  }

  IconData get icon {
    switch (code) {
      case GameResponseCode.failed:
        return FontAwesome5.sad_cry;
      case GameResponseCode.success:
        return FontAwesome5.hand_peace;
      case GameResponseCode.greater:
        return FontAwesome.up_circled;
      case GameResponseCode.smaller:
        return FontAwesome.down_circled;
    }
  }

}