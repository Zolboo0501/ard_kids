import 'package:flutter/material.dart';

import 'package:ard_light/components/custom_header.dart';
import 'package:ard_light/components/language_change.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/features/auth/presentation/widget/question.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordOption extends StatefulWidget {
  ResetPasswordOption({Key? key}) : super(key: key);

  @override
  State<ResetPasswordOption> createState() => _ResetPasswordOptionState();
}

class _ResetPasswordOptionState extends State<ResetPasswordOption> {
  bool showError = false;

  String? selectedType;

  void onChangeRadio(dynamic value) {
    setState(() {
      selectedType = value['type'];
    });
  }

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
      body: Padding(
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewPadding.bottom + 10,
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05,
                    ),
                    child: TextView(
                      text: AppLocalizations.of(context)!.resetPasswordOption,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 25),

                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          onTap: () {
                            GoRouter.of(
                              context,
                            ).push("/auth/reset-password-phone");
                          },
                          contentPadding: const EdgeInsets.all(0),
                          trailing: Icon(
                            Icons.chevron_right,
                            color: Theme.of(context).colorScheme.primary,
                            size: 24,
                          ),
                          leading: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/icons/phone.svg',
                                width: 24,
                                height: 24,
                              ),
                            ),
                          ),
                          title: TextView(
                            text: AppLocalizations.of(
                              context,
                            )!.resetPasswordByPhone,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          onTap: () {
                            GoRouter.of(
                              context,
                            ).push("/auth/reset-password-email");
                          },
                          contentPadding: const EdgeInsets.all(0),
                          trailing: Icon(
                            Icons.chevron_right,
                            color: Theme.of(context).colorScheme.primary,
                            size: 24,
                          ),
                          leading: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/icons/envelope.svg',
                                width: 24,
                                height: 24,
                              ),
                            ),
                          ),
                          title: TextView(
                            text: AppLocalizations.of(
                              context,
                            )!.resetPasswordByEmail,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
