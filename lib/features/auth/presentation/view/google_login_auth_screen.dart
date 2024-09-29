import 'package:flutter/material.dart';
import 'package:linkyou_task/features/auth/presentation/view/widgets/signin_with_google_widget.dart';

class GoogleAuth extends StatelessWidget {
  const GoogleAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
