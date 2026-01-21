import 'package:ard_light/components/button.dart';
import 'package:ard_light/components/input.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ValidateMail extends StatefulWidget {
  final Function(int step) onSave;
  final TextEditingController controller;
  ValidateMail({Key? key, required this.onSave, required this.controller})
    : super(key: key);

  @override
  _ValidateMailState createState() => _ValidateMailState();
}

class _ValidateMailState extends State<ValidateMail> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: AppLocalizations.of(context)!.validateMail,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 25),
            TextView(
              text: AppLocalizations.of(context)!.validateMailDescription,
              fontSize: 14,
            ),
            const SizedBox(height: 15),
            Input(
              controller: widget.controller,
              hintText: AppLocalizations.of(context)!.resetPasswordEmailHint,
              errorMessage: AppLocalizations.of(
                context,
              )!.validateMailInputError,
              label: AppLocalizations.of(context)!.resetPasswordEmailLabel,
            ),
            Spacer(),
            Button(
              onTap: () {
                if (_formKey.currentState!.validate()) {}
              },
              text: AppLocalizations.of(context)!.validate,
            ),
          ],
        ),
      ),
    );
  }
}
