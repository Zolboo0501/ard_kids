import 'package:ard_light/components/custom_header.dart';
import 'package:ard_light/components/input.dart';
import 'package:ard_light/components/language_change.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/features/auth/presentation/widget/question.dart';
import 'package:ard_light/features/auth/presentation/widget/sign_biometric.dart';
import 'package:ard_light/features/auth/presentation/widget/sign_field.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isFaceId = true;
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
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.15,
                    ),
                    child: isFaceId ? SignField() : SignBiometric(),
                  ),
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go("/auth/update-information");
                    },
                    child: Center(
                      child: TextView(
                        text: AppLocalizations.of(
                          context,
                        )!.signInUpdateInformation,
                        textAlign: TextAlign.center,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
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
