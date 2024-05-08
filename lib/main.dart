import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/home/home_screen.dart';

void main() {
 WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: FirebaseOptions(apiKey: 'AIzaSyDKFnmPLXlZUiqKTQnXcsgoyLjXQ52iqPc', 
    appId: '1:580036832035:android:16517c71b9f076015e3a96', 
    messagingSenderId: '580036832035', 
    projectId: 'wanderwise-f3166')
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WanderWise',

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
      ),
      home: const HomeScreen(),
    );
  }
}
