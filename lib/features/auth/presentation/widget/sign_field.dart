import 'package:ard_light/components/button.dart';
import 'package:ard_light/components/dialog.dart';
import 'package:ard_light/components/input.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SignField extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const SignField({Key? key, required this.formKey}) : super(key: key);

  @override
  _SignFieldState createState() => _SignFieldState();
}

class _SignFieldState extends State<SignField> {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Input(
          controller: phone,
          hintText: AppLocalizations.of(context)!.signInInputPhoneError,
          label: AppLocalizations.of(context)!.signInInputPhone,
          isPhone: true,
          errorMessage: AppLocalizations.of(context)!.signInInputPhoneError,
        ),
        const SizedBox(height: 15),
        Input(
          controller: password,
          hintText: AppLocalizations.of(context)!.signInInputPasswordError,
          label: AppLocalizations.of(context)!.signInInputPassword,
          isPassword: true,
          errorMessage: AppLocalizations.of(context)!.signInInputPasswordError,
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              isChecked = !isChecked;
            });
          },
          child: Row(
            children: [
              Checkbox(
                value: isChecked ? isChecked : false,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value ?? false;
                  });
                },
                fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                  if (states.contains(WidgetState.selected)) {
                    return Theme.of(context).colorScheme.primary;
                  }
                  return Theme.of(context).colorScheme.secondary;
                }),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              TextView(
                text: AppLocalizations.of(context)!.signInRememberMe,
                fontSize: 14,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Button(
          text: AppLocalizations.of(context)!.login,
          onTap: () async {
            if (widget.formKey.currentState!.validate()) {
              if (isChecked) {
                await CustomDialog.alert(
                  context,
                  title: AppLocalizations.of(context)!.signInAreSureBiometrics,
                  subtitle: AppLocalizations.of(
                    context,
                  )!.signInAreSureBiometricsDescription,
                  buttonView: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Button(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            text: AppLocalizations.of(
                              context,
                            )!.signInAreSureBiometricsSkip,
                            color: Theme.of(context).colorScheme.onSurface,
                            titleColor: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Button(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            text: AppLocalizations.of(
                              context,
                            )!.signInAreSureBiometricsConfirm,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }
          },
        ),
      ],
    );
  }
}
