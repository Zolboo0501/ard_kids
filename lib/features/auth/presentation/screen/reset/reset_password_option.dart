import 'package:ard_light/components/button.dart';
import 'package:flutter/material.dart';

import 'package:ard_light/components/custom_header.dart';
import 'package:ard_light/components/language_change.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/features/auth/presentation/widget/question.dart';
import 'package:ard_light/l10n/app_localizations.dart';
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
    List<dynamic> options = [
      {
        "label": AppLocalizations.of(context)!.resetPasswordEmail,
        "type": "email",
      },
      {
        "label": AppLocalizations.of(context)!.resetPasswordPhone,
        "type": "phone",
      },
    ];

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
                  RadioGroup<String>(
                    groupValue: selectedType,
                    onChanged: (value) {
                      setState(() {
                        selectedType = value;
                      });
                    },
                    child: Column(
                      children: [
                        for (int i = 0; i < options.length; i++)
                          ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            leading: Radio<String>(value: options[i]['type']),
                            title: TextView(
                              text: options[i]['label'],
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            onTap: () {
                              onChangeRadio(options[i]);
                            },
                          ),

                        if (showError)
                          TextView(
                            text: AppLocalizations.of(
                              context,
                            )!.resetPasswordOptionError,
                            color: Theme.of(context).colorScheme.error,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Button(
              onTap: () {
                if (selectedType == null || selectedType!.isEmpty) {
                  setState(() {
                    showError = true;
                  });
                } else {
                  GoRouter.of(context).push("");
                }
              },
              text: AppLocalizations.of(context)!.buttonContinue,
            ),
          ],
        ),
      ),
    );
  }
}
