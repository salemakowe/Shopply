import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopply/screens/dashboard.dart';
import 'firebase_options.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shopply/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FlutterNativeSplash.remove();
  runApp(const MyApp());
}

double textScale = .9;
bool logged = false;
bool appOpened = false;

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
      home: authUser(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/dashboard': (context) => const DashboardPage(),
      },
    );
  }

  authUser() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        //user is logged in
        if (snapshot.hasData) {
          return const DashboardPage();
        }

        //user not logged in
        else {
          return const LoginPage();
        }
      },
    );
  }
}
