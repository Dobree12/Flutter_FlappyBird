import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappybird/components/ground.dart';
import 'package:flappybird/components/pipe.dart';
import 'package:flappybird/constants.dart';
import 'package:flappybird/game.dart';

class Bird extends SpriteComponent with CollisionCallbacks{

  //initialize bird position & size
  Bird () : super(position: Vector2(birdStartX, birdStartY), size: Vector2(birdWidth, birdHeight));

  //physical world
  double velocity =0;
 

 //load
  @override 
  FutureOr<void> onLoad() async {
  //load bird sprite image
  sprite = await Sprite.load('bird.png');

  //add collision
  add(RectangleHitbox());
}

//jump 
void flap( ){
  velocity= jumpStrenght;
}

//update - every second
@override
  void update(double dt){
    //apply gravity
    velocity+=gravity*dt;

    position.y += velocity*dt;
  }


  //colision
  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    //check if bird collides with ground
    if(other is Ground){
      (parent as FlappyBirdGame).GameOver();
    }

    //check if bird collides with pipes
    if(other is Pipe){
      (parent as FlappyBirdGame).GameOver();
    }
  }

}