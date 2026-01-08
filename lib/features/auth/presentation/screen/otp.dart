import 'dart:async';

import 'package:ard_light/components/button.dart';
import 'package:ard_light/components/custom_header.dart';
import 'package:ard_light/components/language_change.dart';
import 'package:ard_light/components/otp_input.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/features/auth/presentation/widget/question.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Otp extends StatefulWidget {
  Otp({Key? key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  String otpValue = "";
  bool isTimeStopped = false;
  int time = 120;
  final _formKey = GlobalKey<FormState>();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    countDown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void countDown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (time > 0) {
        setState(() {
          time--;
        });
      } else {
        timer.cancel();
        setState(() {
          isTimeStopped = true;
        });
      }
    });
  }

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
          title: "",
          rightWidgets: [
            Question(isHasMarginRight: true),
            LanguageChange(isHasMarginRight: true),
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
                          text: AppLocalizations.of(context)!.otpVerifyTitle,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextView(
                        text: AppLocalizations.of(
                          context,
                        )!.otpVerifyDescription("88888888"),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      const SizedBox(height: 20),
                      Form(
                        key: _formKey,
                        child: OtpInput(onComplete: onComplete),
                      ),
                      const SizedBox(height: 10),

                      TextView(
                        text: AppLocalizations.of(context)!.otpVerifyTime(
                          '${(time ~/ 60).toString().padLeft(2, '0')}:${(time % 60).toString().padLeft(2, '0')} ${time ~/ 60 > 0 ? AppLocalizations.of(context)!.otpMinutes : AppLocalizations.of(context)!.otpSeconds}',
                        ),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      if (isTimeStopped) ...[
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isTimeStopped = false;
                              time = 120;
                              _timer?.cancel();
                              countDown();
                            });
                          },
                          child: TextView(
                            text: AppLocalizations.of(context)!.otpResend,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            isUnderline: true,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              Button(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    GoRouter.of(context).push('/auth/setup-password');
                  }
                },
                text: AppLocalizations.of(context)!.validate,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
