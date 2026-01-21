import 'package:ard_light/components/button.dart';
import 'package:ard_light/components/custom_header.dart';
import 'package:ard_light/components/input.dart';
import 'package:ard_light/components/language_change.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/features/auth/presentation/widget/question.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetInputPhone extends StatefulWidget {
  const ResetInputPhone({Key? key}) : super(key: key);

  @override
  _ResetInputPhoneState createState() => _ResetInputPhoneState();
}

class _ResetInputPhoneState extends State<ResetInputPhone> {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomHeader(
          isBack: true,
          rightWidgets: [
            Question(isHasMarginRight: true, isHasBorder: true),
            LanguageChange(isHasMarginRight: true, isHasBorder: true),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(
            right: 15,
            left: 15,
            top: MediaQuery.of(context).size.height * 0.05,
            bottom: MediaQuery.of(context).padding.bottom + 10,
          ),
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: AppLocalizations.of(context)!.resetPasswordPhoneTitle,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(height: 25),
                  TextView(
                    text: AppLocalizations.of(
                      context,
                    )!.resetPasswordPhoneDecription,
                    fontSize: 14,
                  ),
                  const SizedBox(height: 15),
                  Input(
                    controller: phoneController,
                    hintText: AppLocalizations.of(
                      context,
                    )!.resetPasswordPhoneHint,
                    errorMessage: AppLocalizations.of(
                      context,
                    )!.resetPasswordPhoneError,
                    label: AppLocalizations.of(
                      context,
                    )!.resetPasswordPhoneLabel,
                    isPhone: true,
                  ),
                  Spacer(),
                  Button(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        GoRouter.of(
                          context,
                        ).push("/auth/otp", extra: {'isForget': true});
                      }
                    },
                    text: AppLocalizations.of(context)!.validate,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
