import 'dart:async';
import 'package:flame/game.dart';
import 'package:flame/input.dart'; // Add this import
import 'package:flappybird/components/background.dart';
import 'package:flappybird/components/bird.dart';
import 'package:flappybird/components/ground.dart';
import 'package:flappybird/components/pipe.dart';
import 'package:flappybird/components/pipe_manager.dart';
import 'package:flappybird/components/score.dart';
import 'package:flappybird/constants.dart';
import 'package:flutter/material.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection { // Add TapDetector mixin
  /*
    -bird
    -background
    -ground
    -pipes
    -score
  */
  late Bird bird;
  late Background background;
  late Ground ground;
  late PipeManager pipeManager;
  late ScoreText scoreText;
  int score = 0; // Initialize score

  //load
  // ordinea conteaza : background si dupa pasarea
  @override
  FutureOr<void> onLoad() {
    
    //load background
    background = Background(size);
    add(background);

    //load ground
    ground = Ground(size);
    add(ground);
   
   //load bird
    bird = Bird();
    add(bird);
    
    //load pipes
    pipeManager = PipeManager();
    add(pipeManager);

    //load score
    scoreText = ScoreText();
    add(scoreText);


  }

  //tap
  @override
  void onTap() {
    bird.flap();
  }

  //game over
  bool isGameOver=false;

  void GameOver(){
    //
    if (isGameOver)
    return;
     isGameOver=true;
     pauseEngine();

  showDialog(
    context: buildContext!,
     builder: (context)=>AlertDialog(
      title: const Text("Game Over!"),
      content: Text("High Score : $score"),
      actions: [
        TextButton(
          onPressed: (){
            Navigator.pop(context);
            resetGame();
          },
          child: const Text ("Restart"),
        )
      ],
     )
    );
  }
  void resetGame(){
    bird.position= Vector2(birdStartX, birdStartY);
    bird.velocity=0;
    isGameOver=false;
    score = 0; // Reset score
    children.whereType<Pipe>().forEach((pipe)=>pipe.removeFromParent());
    resumeEngine();

  }

  void increaseScore() {
    score += 1;
  }

}