import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_21/helpers/animation_helper.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class MidPianoButton extends StatefulWidget {
  const MidPianoButton({
    super.key, required this.soundkey,
  });
  final String soundkey;

  @override
  State<MidPianoButton> createState() => _MidPianoButtonState();
}

class _MidPianoButtonState extends State<MidPianoButton> with SingleTickerProviderStateMixin{
  late AnimationHelper animation;
  final player=AudioPlayer();
  @override
  void initState() {
    super.initState();
    AnimationController controller=AnimationController(vsync: this);
    SequenceAnimation sequenceAnimation=SequenceAnimationBuilder()
    .addAnimatable(animatable: Tween<double>(begin: 1,end: 0.8), from: Duration.zero, to: const Duration(milliseconds: 200), tag: "scale")
    .addAnimatable(animatable: Tween<double>(begin: 0,end:0.2), from: Duration.zero, to: const Duration(milliseconds: 200), tag: "rotate")
    .animate(controller);
    animation=AnimationHelper(controller, sequenceAnimation);
  }
  @override
  void dispose() {
    animation.animController.dispose();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
              
            },
            onTapDown: (details) async{
              animation.forwardAnimate();
              await player.play(AssetSource("sounds/m${widget.soundkey}.mp3"),volume:100);
            },
            onTapUp: (details) async{
              //await animation.reverseAnimate();
              try {
                await player.stop();
              } catch (e) {
              }
              
              
              
            },
      child: AnimatedBuilder(
        animation: animation.animController,
        builder:(context, child) => Transform.scale(
          scale: animation.seqAnimation["scale"].value,
          child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()..setEntry(3, 2, 0.01)..rotateX(animation.seqAnimation["rotate"].value),
            child: Container(
              width: MediaQuery.of(context).size.width / 20,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: const Offset(0, 25),
                      blurRadius: 3,
                      spreadRadius: -10)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

