import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappybird/game.dart';

class Pipe extends SpriteComponent with CollisionCallbacks, HasGameRef <FlappyBirdGame>{
  
  final bool isTopPipe;
  bool scored = false;

  Pipe(Vector2 position, Vector2 size, {required this.isTopPipe})
  : super (position: position, size: size);

  


  
     @override 
  FutureOr<void> onLoad() async {
  //load bird sprite image
  sprite = await Sprite.load(isTopPipe ? 'top-pipe.png': 'bottom-pipe-green.png');

  //add collision
  add(RectangleHitbox());
}
void update(double dt){

  //scroll pipe to left
  position.x -= 100  * dt;

  // check if the bird has passed this pipe
  if (!scored && position.x + size.x < gameRef.bird.position.x ) {
    scored = true;
    if (isTopPipe){
    gameRef.increaseScore();
    }
  }


  //remove pipe if it goes off the screen
    if(position.x +size.x <=0)
     removeFromParent();


  }
}