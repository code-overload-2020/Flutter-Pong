import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pong_local/Game/player/player.dart';

class PongGame extends Game with VerticalDragDetector{
  Size screenSize;
  bool hasWon = false;
  Player _player;

  PongGame() {
    initController();
  }

  @override
  onVerticalDragUpdate(DragUpdateDetails details){
    _player.onVerticleUpdate(details);
  }

  initController() async {
    resize(await Flame.util.initialDimensions());
    _player = new Player(this);
  }

  @override
  void render(Canvas c) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint()..color = Color(0xffFFFFFF);
    c.drawRect(bgRect, bgPaint);

    //Player render here
    _player.render(c);
  }

  @override
  void update(double t) {
    _player.update(t);
  }

  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }
}
