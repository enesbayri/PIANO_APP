import 'package:flutter/material.dart';
import 'package:flutter_application_21/helpers/animation_helper.dart';

class BigPianoButton extends StatelessWidget {
  const BigPianoButton({
    super.key,
    required this.isStart, required this.animation,
  });

  final bool? isStart;
  final AnimationHelper animation;
  

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation.animController,
      builder:(context, child) => Transform.scale(
        scale: animation.seqAnimation["scale"].value,
        child: Transform(
          transform: Matrix4.identity()
          ..setEntry(3, 2, 0.01)
          ..rotateX(animation.seqAnimation["rotate"].value),
          alignment: FractionalOffset.center,
          child: Container(
            width: isStart != null
                ? MediaQuery.of(context).size.width / 8
                : MediaQuery.of(context).size.width / 10,
            height: MediaQuery.of(context).size.height / 1.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              border: const BorderDirectional(
                  top: BorderSide(color: Colors.black, width: 10)),
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
    );
  }
}
