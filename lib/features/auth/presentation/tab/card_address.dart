import 'package:ard_light/components/button.dart';
import 'package:ard_light/components/input.dart';
import 'package:ard_light/components/select.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CardAddress extends StatefulWidget {
  final TextEditingController descriptionController;
  final Function(int) onSave;
  final Map<String, dynamic> address;
  CardAddress({
    Key? key,
    required this.descriptionController,
    required this.onSave,
    required this.address,
  }) : super(key: key);

  @override
  _CardAddressState createState() => _CardAddressState();
}

class _CardAddressState extends State<CardAddress> {
  final _formKey = GlobalKey<FormState>();

  void onChange(String type, String value) {
    setState(() {
      widget.address[type] = value;
    });
  }

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
              text: AppLocalizations.of(context)!.validateAddress,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 25),
            TextView(
              text: AppLocalizations.of(context)!.validateAddressDescription,
              fontSize: 14,
            ),

            const SizedBox(height: 20),

            Select(
              options: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
              value: widget.address['city'],
              onChange: (value) => onChange('city', value),
              label: AppLocalizations.of(context)!.validateAddressCity,
              hintText: AppLocalizations.of(context)!.validateAddressCity,
              validator: (value) {
                if (value == null || value.toString().isEmpty) {
                  return AppLocalizations.of(context)!.validateAddressCityError;
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            Select(
              options: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
              value: widget.address['district'],
              onChange: (value) => onChange('district', value),
              label: AppLocalizations.of(context)!.validateAddressCity,
              hintText: AppLocalizations.of(context)!.validateAddressCity,
              validator: (value) {
                if (value == null || value.toString().isEmpty) {
                  return AppLocalizations.of(
                    context,
                  )!.validateAddressDistrictError;
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            Select(
              options: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
              value: widget.address['branch'],
              onChange: (value) => onChange('branch', value),
              label: AppLocalizations.of(context)!.validateAddressBranch,
              hintText: AppLocalizations.of(context)!.validateAddressBranch,
              validator: (value) {
                if (value == null || value.toString().isEmpty) {
                  return AppLocalizations.of(
                    context,
                  )!.validateAddressBranchError;
                }
                return null;
              },
            ),

            const SizedBox(height: 15),
            Input(
              controller: widget.descriptionController,
              hintText: AppLocalizations.of(
                context,
              )!.validateAddressBranchDescription,
              errorMessage: AppLocalizations.of(
                context,
              )!.validateAddressBranchDescription,
              label: AppLocalizations.of(
                context,
              )!.validateAddressBranchDescription,
            ),

            Spacer(),

            Button(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  widget.onSave(4);
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
