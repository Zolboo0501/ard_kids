import 'package:ard_light/components/button.dart';
import 'package:ard_light/components/input.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ChildLoginUsername extends StatefulWidget {
  final Function(int) onSave;
  final TextEditingController controller;

  const ChildLoginUsername({
    Key? key,
    required this.onSave,
    required this.controller,
  }) : super(key: key);

  @override
  _ChildLoginUsernameState createState() => _ChildLoginUsernameState();
}

class _ChildLoginUsernameState extends State<ChildLoginUsername> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: AppLocalizations.of(context)!.validateLoginUsernameTitle,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 25),
            TextView(
              text: AppLocalizations.of(
                context,
              )!.validateLoginUsernameDescription,
              fontSize: 14,
            ),

            const SizedBox(height: 20),

            Input(
              controller: widget.controller,
              hintText: AppLocalizations.of(context)!.validateLoginUsername,
              errorMessage: AppLocalizations.of(
                context,
              )!.validateMailInputError,
              label: AppLocalizations.of(context)!.validateLoginUsername,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(
                    context,
                  )!.validateLoginUsernameError;
                }
                if (value.length < 7) {
                  return 'Must be at least 7 characters';
                }
                if (value.length > 20) {
                  return 'Must not exceed 20 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 5),
            TextView(
              text: AppLocalizations.of(
                context,
              )!.validateLoginUsernameValidation,
              fontSize: 12,
            ),
            Spacer(),

            Button(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  widget.onSave(5);
                }
              },
              text: AppLocalizations.of(context)!.validate,
            ),
          ],
        ),
      ),
    );
  }
}
