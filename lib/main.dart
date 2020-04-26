import 'package:flame/gestures.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pong_local/Game/pong-game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  PongGame _pongGame = new PongGame();


  // DragGestureRecognizer dragger = DragGestureRecognizer();
  // TapGestureRecognizer tapper = TapGestureRecognizer();
  // tapper.onTapDown = _pongGame.onTapDown;

  runApp(_pongGame.widget);

  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);
  // flameUtil.addGestureRecognizer(tapper);
}
