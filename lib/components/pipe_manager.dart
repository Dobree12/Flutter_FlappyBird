import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappybird/constants.dart';
import 'package:flappybird/game.dart';
import 'package:flappybird/components/pipe.dart';

class PipeManager extends Component with HasGameRef<FlappyBirdGame>{

  double pipeSpawnTimer=0;
  final double maxTopPipeHeight = 300; // Add this line to set an upper limit for the top pipe height

  @override 
  void update( double dt){
    pipeSpawnTimer +=dt;
   
    if(pipeSpawnTimer> pipeInterval){
      pipeSpawnTimer=0;
      spawnPipe();
    }
  }

//spawn new pipes

void spawnPipe(){
  final double screenHeight =gameRef.size.y;

final double maxPipeHeight
 = screenHeight - pipeGap - minPipeHeight;
final double bottomPipeHeight
 = minPipeHeight + Random().nextDouble() * (maxPipeHeight-minPipeHeight);
final double topPipeHeight 
= min(maxTopPipeHeight, screenHeight - groundHeight - bottomPipeHeight -pipeGap);


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