import 'dart:async';

import 'package:flame/components.dart';

class Background extends SpriteComponent{

  //init background

  Background(Vector2 size) 
  : super (
    size: size,
     position: Vector2(0, 0)
     );

     @override
     FutureOr<void> onLoad ()async {
      //load the background sprite
      sprite = await Sprite.load('background.png');
     }
}