import 'package:flutter/material.dart';
import 'package:sr_edu_care/core/constants/app_assets.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [Image.asset(whiteLogo)]));
  }
}
