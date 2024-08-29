import 'package:flutter/material.dart';
import "package:boutiqa/pages/login.dart";
import "package:boutiqa/pages/signup.dart";
import "package:boutiqa/pages/designer_activity.dart";
import "package:boutiqa/pages/user_activity.dart";
import "package:boutiqa/pages/gender.dart";
import "package:boutiqa/pages/chat.dart";
import 'package:boutiqa/pages/auth_page.dart';
import 'package:boutiqa/pages/new.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // initialRoute: "/user_activity",
    initialRoute: "/auth",
    routes: {
      "/login": (context) => Login(),
      "/signup": (context) => Signup(),
      "/design_activity": (context) => DesignerActivity(),
      "/user_activity": (context) => UserActivity(),
      "/gender": (context) => CustomizeScreen(),
      "/chat": (context) => ChatScreen(),
      "/test": (context) => HomePage(),
      "/auth": (context) => AuthPage(),
    },

    //home: ClockScreen(),
  ));
}
