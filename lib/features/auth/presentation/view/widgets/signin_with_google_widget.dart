import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:linkyou_task/features/auth/presentation/view_model/auth_view_model.dart';
import 'package:linkyou_task/features/auth/presentation/view_model/post_new_user_model.dart';

class SigninWIthGoogleWidget extends StatelessWidget {
  const SigninWIthGoogleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
              UserCredential? result = await AuthViewModel.createAuthUser();
              if (result == null) {
                log("Error");
              } else {
                await PostNewUser.addNewUser(result.user!.displayName!)
                    .then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        "Success Create Account and Posted to APi",
                        style: TextStyle(color: Colors.white),
                      )));
                });
              }
              Future.delayed(Duration(seconds: 5)).then((value) {
                GoogleSignIn().signOut();
              });
            },
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(4.0, 4.0),
                  blurStyle: BlurStyle.outer),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.black)),
        height: 70,
        width: 260,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Image.asset(
                "assets/images/google_logo.png",
                fit: BoxFit.cover,
                width: 50,
              ),
              SizedBox(
                width: 20,
              ),
              Text("Sign In With Google")
            ],
          ),
        ),
      ),
    );
  }
}
