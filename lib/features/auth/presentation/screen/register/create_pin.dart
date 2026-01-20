import 'package:ard_light/components/button.dart';
import 'package:ard_light/components/custom_header.dart';
import 'package:ard_light/components/dialog.dart';
import 'package:ard_light/components/language_change.dart';
import 'package:ard_light/components/otp_input.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/features/auth/presentation/widget/question.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CreatePin extends StatefulWidget {
  CreatePin({Key? key}) : super(key: key);

  @override
  _CreatePinState createState() => _CreatePinState();
}

class _CreatePinState extends State<CreatePin> {
  String otpValue = '';
  final _formKey = GlobalKey<FormState>();

  void onComplete(String value) {
    setState(() {
      otpValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomHeader(
          isBack: true,
          title: '',
          rightWidgets: [
            Question(isHasMarginRight: true, isHasBorder: true),
            LanguageChange(isHasMarginRight: true, isHasBorder: true),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(
            top: 10,
            bottom: MediaQuery.of(context).padding.bottom + 10,
            left: 15,
            right: 15,
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05,
                        ),
                        child: TextView(
                          text: AppLocalizations.of(context)!.createPinTitle,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Form(
                        key: _formKey,
                        child: OtpInput(
                          onComplete: onComplete,
                          errorMessage: AppLocalizations.of(
                            context,
                          )!.createPinError,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              Button(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    await CustomDialog.success(
                      context,
                      title: AppLocalizations.of(context)!.createPinSuccess,
                      buttonTitle: "OK",
                      navigation: "/auth/signIn",
                    );
                  }
                },
                text: AppLocalizations.of(context)!.buttonContinue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
