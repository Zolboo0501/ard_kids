import 'package:ard_light/components/custom_header.dart';
import 'package:ard_light/components/language_change.dart';
import 'package:ard_light/features/auth/presentation/widget/question.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        isBack: true,
        title: "",
        rightWidgets: [
          Question(isHasMarginRight: true, isHasBorder: true),
          LanguageChange(isHasMarginRight: true, isHasBorder: true),
        ],
      ),
    );
  }
}
