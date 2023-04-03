import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test/constants/custom_colors.dart';
import 'package:test/views/login_view.dart';
import 'package:test/views/todo_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
          if(snapshot.hasData){
            return const TodoView();
          }else{
            return const LoginView();
          }
        }),
      );
  }
}

