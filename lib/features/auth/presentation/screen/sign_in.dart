import 'package:ard_light/components/custom_header.dart';
import 'package:ard_light/components/language_change.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/features/auth/presentation/widget/question.dart';
import 'package:ard_light/features/auth/presentation/widget/sign_biometric.dart';
import 'package:ard_light/features/auth/presentation/widget/sign_field.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isFaceId = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onChangeState() {
    setState(() {
      isFaceId = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomHeader(
          title: "",
          isLogo: true,
          rightWidgets: [
            Question(isHasMarginRight: true, isHasBorder: true),
            LanguageChange(isHasMarginRight: true, isHasBorder: true),
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
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.15,
                      ),
                      child: !isFaceId
                          ? SignField(formKey: formKey)
                          : SignBiometric(
                              formKey: formKey,
                              onChangeState: onChangeState,
                            ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: TextView(
                        text: AppLocalizations.of(context)!.signInReset,
                        textAlign: TextAlign.center,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
