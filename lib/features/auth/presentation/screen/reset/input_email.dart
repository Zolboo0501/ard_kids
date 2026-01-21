import 'package:ard_light/components/button.dart';
import 'package:ard_light/components/custom_header.dart';
import 'package:ard_light/components/input.dart';
import 'package:ard_light/components/language_change.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/features/auth/presentation/widget/question.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetInputEmail extends StatefulWidget {
  const ResetInputEmail({Key? key}) : super(key: key);

  @override
  _ResetInputEmailState createState() => _ResetInputEmailState();
}

class _ResetInputEmailState extends State<ResetInputEmail> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.resetPasswordEmailError;
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return AppLocalizations.of(context)!.resetPasswordEmailError;
    }
    return null;
  }

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
                    text: AppLocalizations.of(context)!.resetPasswordEmailTitle,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(height: 25),
                  TextView(
                    text: AppLocalizations.of(
                      context,
                    )!.resetPasswordEmailDecription,
                    fontSize: 14,
                  ),
                  const SizedBox(height: 15),
                  Input(
                    controller: emailController,
                    hintText: AppLocalizations.of(
                      context,
                    )!.resetPasswordEmailHint,
                    errorMessage: AppLocalizations.of(
                      context,
                    )!.validateMailInputError,
                    label: AppLocalizations.of(
                      context,
                    )!.resetPasswordEmailLabel,
                    validator: validateEmail,
                  ),
                  Spacer(),
                  Button(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        GoRouter.of(context).push(
                          "/auth/reset-password",
                          extra: {"isForget": true},
                        );
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
