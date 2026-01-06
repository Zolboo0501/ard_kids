import 'package:ard_light/components/button.dart';
import 'package:ard_light/components/input.dart';
import 'package:ard_light/components/register_input.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/features/auth/presentation/models/register.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ValidateInfo extends StatefulWidget {
  final RegisterController controller;
  final Function(int step) onSave;

  const ValidateInfo({Key? key, required this.controller, required this.onSave})
    : super(key: key);

  @override
  _ValidateInfoState createState() => _ValidateInfoState();
}

class _ValidateInfoState extends State<ValidateInfo> {
  String registerInput = '';

  void onChange(String type, String value) {
    if (type == 'first') {
      setState(() {
        if (registerInput.length < 2) {
          registerInput = value;
        } else {
          String temp = registerInput.toString();
          registerInput = value + temp.substring(1);
        }
        Navigator.pop(context);
      });
    }
    if (type == 'second') {
      setState(() {
        if (registerInput.isNotEmpty) {
          String temp = registerInput.toString();
          registerInput = temp.substring(0, 1) + value;
        }
        Navigator.pop(context);
      });
    }
    if (type == 'third') {
      setState(() {
        String temp = registerInput.toString();
        registerInput = temp.substring(0, 2) + value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            text: AppLocalizations.of(context)!.validateInfo,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          const SizedBox(height: 25),
          TextView(
            text: AppLocalizations.of(context)!.validateInfoDescription,
            fontSize: 14,
          ),

          const SizedBox(height: 20),

          Input(
            controller: widget.controller.familyNameController,
            hintText: AppLocalizations.of(context)!.validateChildFamilyName,
            errorMessage: "",
            label: AppLocalizations.of(context)!.validateChildFamilyName,
          ),

          const SizedBox(height: 15),

          Input(
            controller: widget.controller.parentNameController,
            hintText: AppLocalizations.of(context)!.validateChildParentName,
            errorMessage: "",
            label: AppLocalizations.of(context)!.validateChildParentName,
          ),

          const SizedBox(height: 15),

          Input(
            controller: widget.controller.nameController,
            hintText: AppLocalizations.of(context)!.validateChildName,
            errorMessage: "",
            label: AppLocalizations.of(context)!.validateChildName,
          ),

          const SizedBox(height: 15),

          Registerinput(registerInput: registerInput, onChange: onChange),
          Spacer(),
          Button(
            onTap: () {
              print(registerInput);
            },
            text: AppLocalizations.of(context)!.validate,
          ),
        ],
      ),
    );
  }
}
