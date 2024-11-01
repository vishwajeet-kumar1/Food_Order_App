import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food/splash_screen.dart';



void main() async{WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class DefaultFirebaseOptions {
  static var currentPlatform;
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
