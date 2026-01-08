import 'package:ard_light/components/button.dart';
import 'package:ard_light/components/custom_header.dart';
import 'package:ard_light/components/input.dart';
import 'package:ard_light/components/language_change.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/features/auth/presentation/widget/question.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InvitationCode extends StatefulWidget {
  InvitationCode({Key? key}) : super(key: key);

  @override
  _InvitationCodeState createState() => _InvitationCodeState();
}

class _InvitationCodeState extends State<InvitationCode> {
  final TextEditingController controller = TextEditingController();

  void onSkip() {
    GoRouter.of(context).push('/auth/danSignUp');
  }

  void onContinue() {
    if (controller.text.isNotEmpty) {
      GoRouter.of(context).push('/auth/danSignUp');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CustomHeader(
          isBack: true,
          title: "",
          rightWidgets: [
            Question(isHasMarginRight: true),
            LanguageChange(isHasMarginRight: true),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          text: AppLocalizations.of(
                            context,
                          )!.invitationCodeTitle,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Input(
                        controller: controller,
                        hintText: AppLocalizations.of(
                          context,
                        )!.invitationCodeInput,
                        label: AppLocalizations.of(
                          context,
                        )!.invitationCodeInput,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 15,
                  bottom: MediaQuery.of(context).padding.bottom,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Button(
                        onTap: onSkip,
                        text: AppLocalizations.of(
                          context,
                        )!.validateContractReject,
                        color: Theme.of(context).colorScheme.secondary,
                        titleColor: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Button(
                        onTap: onContinue,
                        text: AppLocalizations.of(
                          context,
                        )!.validateContractApprove,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
