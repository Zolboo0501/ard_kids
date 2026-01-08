import 'package:ard_light/components/custom_header.dart';
import 'package:ard_light/components/language_change.dart';
import 'package:ard_light/features/auth/presentation/widget/question.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        appBar: CustomHeader(
          title: "",
          isLogo: true,
          rightWidgets: [
            Question(isHasMarginRight: true),
            LanguageChange(isHasMarginRight: true),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
            top: 10,
            bottom: MediaQuery.of(context).padding.bottom + 10,
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
