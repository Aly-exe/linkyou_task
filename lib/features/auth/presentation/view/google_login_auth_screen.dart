import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:linkyou_task/features/auth/presentation/view/widgets/signin_with_google_widget.dart';
import 'package:linkyou_task/features/auth/presentation/view_model/auth_view_model.dart';
import 'package:linkyou_task/features/auth/presentation/view_model/post_new_user_model.dart';

class GoogleAuth extends StatelessWidget {
  const GoogleAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SigninWIthGoogleWidget(),
          ),
        ],
      ),
    ));
  }
}
