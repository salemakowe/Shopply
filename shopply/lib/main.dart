import 'package:flutter/material.dart';
import "package:firebase_core/firebase_core.dart";
import 'firebase_options.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shopply/screens/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FlutterNativeSplash.remove();
  runApp(const MyApp());
}

double textScale = .9;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
