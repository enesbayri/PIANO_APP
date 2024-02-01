import 'package:flutter/material.dart';
import 'package:flutter_application_21/widgets/piano_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/bg.png",
                ),
                fit: BoxFit.fill)),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const PianoWidget(),
      ),
    );
  }
}