// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:covid_app/screens/auth_screen.dart';
import 'package:covid_app/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(CovidApp());
}

class CovidApp extends StatelessWidget {
  const CovidApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, appSnapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Covid 19 Tracking App',
          theme: ThemeData(
            primarySwatch: Colors.red,
            backgroundColor: Colors.red,
            accentColor: Colors.blue,
            accentColorBrightness: Brightness.dark,
            buttonTheme: ButtonTheme.of(context).copyWith(
              buttonColor: Colors.red,
              textTheme: ButtonTextTheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          home: appSnapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : StreamBuilder(
                  stream: FirebaseAuth.instance.onAuthStateChanged,
                  builder: (ctx, userSnapshot) {
                    if (userSnapshot.hasData) {
                      return HomePage();
                    }
                    return AuthScreen();
                  }),
        );
      },
    );
  }
}
