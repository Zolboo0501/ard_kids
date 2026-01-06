import 'package:ard_light/components/button.dart';
import 'package:ard_light/components/custom_header.dart';
import 'package:ard_light/components/dialog.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: CustomHeader(
        title: AppLocalizations.of(context)!.headerTitleXyp,
        isBack: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 15, vertical: 10),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  Image.asset(
                    "assets/images/xyp.png",
                    height: 100,
                    width: 100,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 15),
                  TextView(
                    text: AppLocalizations.of(context)!.titleXyp,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primary,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  TextView(
                    text: AppLocalizations.of(context)!.descriptionXyp,
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  Button(
                    onTap: () async {
                      await CustomDialog.alert(
                        context,
                        title: AppLocalizations.of(
                          context,
                        )!.registerVerifyAlertTitle,
                        subtitle: AppLocalizations.of(
                          context,
                        )!.registerVerifyAlertSubtitle,
                        buttonView: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Button(
                                  onTap: () {
                                    Navigator.pop(context);
                                    GoRouter.of(context).pop();
                                  },
                                  text: AppLocalizations.of(
                                    context,
                                  )!.registerVerifyAlertButtonTitle2,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
                                  titleColor: Theme.of(
                                    context,
                                  ).colorScheme.primary,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Button(
                                  onTap: () {
                                    Navigator.pop(context);
                                    GoRouter.of(
                                      context,
                                    ).push('/auth/registerChildren');
                                  },
                                  color: Theme.of(context).colorScheme.primary,
                                  text: AppLocalizations.of(
                                    context,
                                  )!.registerVerifyAlertButtonTitle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    color: Theme.of(context).colorScheme.primary,
                    text: AppLocalizations.of(context)!.registerButton,
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
