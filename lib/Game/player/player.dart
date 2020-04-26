import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pong_local/Game/pong-game.dart';

class Player {
  PongGame _game = new PongGame();
  Rect _player;

  double _playerWidth = 0;
  double _playerHeight = 0;
  double _playerLeftMargin = 0;
  Offset _playerOffset;
  Offset _playerOldOffset;
  double _playerSpeed = 4.0;

  Player(this._game) {
    final size = _game.screenSize;
    _playerWidth = size.width * 0.025;
    _playerHeight = size.height * 0.075;
    _playerLeftMargin = _playerWidth / 2;
    _player = Rect.fromLTWH(size.width - _playerWidth - _playerLeftMargin,
        size.height / 2 - _playerHeight / 2, _playerWidth, _playerHeight);
    _playerOffset = new Offset(0, 1);
  }

  void render(Canvas c) {
    Paint _paint = new Paint()..color = Color(0xff000000);
    c.drawRect(_player, _paint);
  }

  void update(double t) {
    if (_playerOldOffset != _playerOffset &&
        _player.top + _playerOffset.dy * _playerSpeed > 0 &&
        _player.bottom + _playerOffset.dy * _playerSpeed <
            _game.screenSize.height) {
      _player = _player.shift(new Offset(0.0, _playerOffset.dy * _playerSpeed));
      _playerOldOffset = _playerOffset;
      print(_player.bottom);
    }
  }

  onVerticleUpdate(DragUpdateDetails details) {
    _playerOffset = details.delta;
    // print(details.delta);
  }
}
