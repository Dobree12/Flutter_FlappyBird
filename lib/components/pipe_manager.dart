
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappybird/constants.dart';
import 'package:flappybird/game.dart';
import 'package:flappybird/components/pipe.dart';

class PipeManager extends Component with HasGameRef<FlappyBirdGame>{

  double pipeSpawnTimer=0;

  @override 
  void update( double dt){
    pipeSpawnTimer +=dt;
    const double pipeInterval =50;

    if(pipeSpawnTimer> pipeInterval){
      pipeSpawnTimer=0;
      spawnPipe();
    }
  }

//spawn new pipes

void spawnPipe(){
  final double screenHeight =gameRef.size.y;
  const double pipeGap = 150;
  const double minPipeHeight = 50;
  const double pipeWidth=60;
  


final double maxPipeHeight
 = screenHeight - pipeGap - minPipeHeight;
final double bottomPipeHeight
 = minPipeHeight + Random().nextDouble() * (maxPipeHeight-minPipeHeight);
final double topPipeHeight 
= screenHeight - groundHeight - bottomPipeHeight -pipeGap;


//create bottom pipe
final bottomPipe = Pipe(
   Vector2(gameRef.size.x, screenHeight - groundHeight - bottomPipeHeight),
   Vector2(pipeWidth, bottomPipeHeight),
  isTopPipe:  false,
);

// create top pipe
final topPipe = Pipe(
 Vector2(gameRef.size.x, 0),
 Vector2(pipeWidth, topPipeHeight),
 isTopPipe: true,
);

gameRef.add(bottomPipe);
gameRef.add(topPipe);


}




}