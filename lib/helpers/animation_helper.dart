

import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class AnimationHelper{

  AnimationController animController;
  SequenceAnimation seqAnimation;
  AnimationHelper(this.animController,this.seqAnimation);
  void forwardAnimate()async{
    await animController.forward();
  }
  Future<void> reverseAnimate()async{
    await animController.reverse();
  }

  /*
  static animate()async{
    await controller.forward();
    controller.reverse();
  }
  static onHover()async{
    await controller.forward();
  }
  static reverseHover(){
    controller.reverse();
  }*/
}