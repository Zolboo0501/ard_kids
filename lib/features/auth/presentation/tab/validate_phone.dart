import 'package:ard_light/components/button.dart';
import 'package:ard_light/components/input.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ValidatePhone extends StatefulWidget {
  final Function(int step) onSave;
  final TextEditingController controller;
  ValidatePhone({Key? key, required this.onSave, required this.controller})
    : super(key: key);

  @override
  _ValidatePhoneState createState() => _ValidatePhoneState();
}

class _ValidatePhoneState extends State<ValidatePhone> {
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
              text: AppLocalizations.of(context)!.validatePhone,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 25),
            TextView(
              text: AppLocalizations.of(context)!.validatePhoneDescription,
              fontSize: 14,
            ),
            const SizedBox(height: 15),
            Input(
              controller: widget.controller,
              hintText: AppLocalizations.of(context)!.validatePhoneInputHint,
              errorMessage: AppLocalizations.of(
                context,
              )!.validatePhoneInputError,
              label: AppLocalizations.of(context)!.validatePhoneInputLabel,
              isPhone: true,
            ),
            Spacer(),
            Button(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  widget.onSave(2);
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
