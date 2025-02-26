import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappybird/game.dart';

class Pipe extends SpriteComponent with CollisionCallbacks, HasGameRef <FlappyBirdGame>{
  
  final bool isTopPipe;

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

  //move ground to left
  position.x -= 100  * dt;

    if(position.x +size.x <=0)
     removeFromParent();


  }
}