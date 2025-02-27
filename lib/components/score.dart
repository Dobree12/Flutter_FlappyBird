import 'dart:async';
import 'package:flame/components.dart';
import 'package:flappybird/game.dart';
import 'package:flutter/painting.dart';

class ScoreText extends TextComponent with HasGameRef<FlappyBirdGame> {
  ScoreText() : super(
    text: '0', // Initialize with '0'
    textRenderer: TextPaint(
      style: TextStyle(
        color: Color.fromRGBO(43, 40, 40, 1),
        fontFamily:'Arial',
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  @override
  FutureOr<void> onLoad() {
    //set position to lower middle
    position = Vector2(
      //center horizontally
      (gameRef.size.x - size.x) / 2,
      //slightly above the bottom
      gameRef.size.y - size.y - 50,
    );
  }

  @override
  void update(double dt) {
    final newText = gameRef.score.toString();
    if (text != newText) {
      text = newText;
    }
  }
}