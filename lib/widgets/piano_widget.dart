import 'package:flutter/material.dart';
import 'package:flutter_application_21/widgets/piano_buttons.dart';

class PianoWidget extends StatelessWidget {
  const PianoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  const Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PianoButton(isStart: true,soundkey:"a"),
          PianoButton(soundkey:"b"),
          PianoButton(soundkey:"c"),
          PianoButton(soundkey:"d"),
          PianoButton(soundkey:"e"),
          PianoButton(soundkey:"f"),
          PianoButton(soundkey:"g"),
          PianoButton(isEnd: true,soundkey:"a2"),
        ],
      ),
    );
  }
}

