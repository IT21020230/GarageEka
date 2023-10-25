import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:garage_eka/services_center/add.dart';
import 'package:garage_eka/services_center/appointment_details.dart';
import 'package:garage_eka/services_center/appointments.dart';
import 'package:garage_eka/services_center/list.dart';
import 'package:garage_eka/services_center/nav.dart';
import 'package:garage_eka/shop/add.dart';
import 'package:garage_eka/shop/interior.dart';
import 'package:garage_eka/shop/list.dart';
import 'package:garage_eka/shop/nav.dart';
import 'package:garage_eka/user/appointment_book.dart';
import 'package:garage_eka/user/appointments.dart';
import 'package:garage_eka/user/assistant.dart';
import 'package:garage_eka/user/nav.dart';
import 'package:garage_eka/user/service_about.dart';
import 'package:garage_eka/workshop/add.dart';
import 'firebase_options.dart';
import 'package:garage_eka/screens/login_screen.dart';
import 'package:garage_eka/screens/registration_screen.dart';
import 'package:garage_eka/screens/home_screen.dart';
import 'package:garage_eka/services/authentication_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print('Firebase initialized.');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthenticationService _auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase Auth App',
      home: StreamBuilder(
        stream: _auth.authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User? user = snapshot.data as User?;
            if (user == null) {
              return ServiceList();
            }
            return ServiceList();
          }
          return CircularProgressIndicator();
        },
      ),
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegistrationScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
