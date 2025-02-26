import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappybird/constants.dart';
import 'package:flappybird/game.dart';

class Ground extends SpriteComponent with HasGameRef<FlappyBirdGame>, CollisionCallbacks{

// init the ground
Ground (Vector2 size)
: super (
  size: size,
  position: Vector2(0, 0)
);


@override
FutureOr<void> onLoad() async{
  //load the ground
  size= Vector2(2* gameRef.size.x, groundHeight);
  position= Vector2(0, gameRef.size.y - groundHeight);

  //load ground spirte image
  sprite = await Sprite.load('base.png');

  add(RectangleHitbox());
}
//update

@override
void update(double dt){

  //move ground to left
  position.x -= 100  * dt;


  //reset ground if it goes off the screen for infinite scroll
  // if half of ground has passed, reset.
  if(position.x + size.x /2 <=0){  
    position.x = 0;
}
}
  


}