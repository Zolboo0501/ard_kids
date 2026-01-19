import 'package:ard_light/components/button.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignBiometric extends StatefulWidget {
  SignBiometric({Key? key}) : super(key: key);

  @override
  _SignBiometricState createState() => _SignBiometricState();
}

class _SignBiometricState extends State<SignBiometric> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset("assets/icons/user.svg", width: 56, height: 56),
        const SizedBox(height: 8),
        TextView(
          text: AppLocalizations.of(context)!.signInWelcome,
          fontSize: 14,
        ),
        const SizedBox(height: 8),
        TextView(text: "Б.Тэмүүлэн", fontSize: 22, fontWeight: FontWeight.w800),
        const SizedBox(height: 20),
        Button(
          onTap: () {},
          text: AppLocalizations.of(context)!.login,
          icon: SvgPicture.asset(
            'assets/icons/biometric.svg',
            width: 18,
            height: 18,
          ),
        ),
        const SizedBox(height: 30),
        GestureDetector(
          onTap: () {},
          child: TextView(text: AppLocalizations.of(context)!.signInNewUser),
        ),
      ],
    );
  }
}
