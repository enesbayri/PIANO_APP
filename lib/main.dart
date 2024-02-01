
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_21/pages/home_page.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((_) {
    runApp(const PianoApp());
  });
}

class PianoApp extends StatelessWidget {
  const PianoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Piano App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage());
  }
}



