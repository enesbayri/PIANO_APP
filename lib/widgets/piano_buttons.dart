import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_21/helpers/animation_helper.dart';
import 'package:flutter_application_21/widgets/big_button.dart';
import 'package:flutter_application_21/widgets/mid_button.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class PianoButton extends StatefulWidget {
  const PianoButton({super.key, this.isEnd, this.isStart, required this.soundkey});
  final bool? isEnd;
  final bool? isStart;
  final String soundkey;

  @override
  State<PianoButton> createState() => _PianoButtonState();
}

class _PianoButtonState extends State<PianoButton> with SingleTickerProviderStateMixin{
  late AnimationHelper animation;
  final player = AudioPlayer();
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
    return Flexible(
        child: Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 1.0),
          child: GestureDetector(
            onTap: () {
              
            },
            onTapDown: (details) async{
              animation.forwardAnimate();
              await player.play(AssetSource("sounds/${widget.soundkey}.mp3"),volume:100);
            },
            onTapUp: (details) async{
              await animation.reverseAnimate();
              await player.stop();
            },
            child: BigPianoButton(isStart: widget.isStart,animation:animation),
          ),
        ),
        widget.isEnd == null
            ?  Positioned(right: 0, top: 0, child: MidPianoButton(soundkey:widget.soundkey))
            : const SizedBox()
      ],
    ));
  }
}

