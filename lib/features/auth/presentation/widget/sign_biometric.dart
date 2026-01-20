import 'package:ard_light/components/button.dart';
import 'package:ard_light/components/input.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignBiometric extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function onChangeState;
  const SignBiometric({
    Key? key,
    required this.formKey,
    required this.onChangeState,
  }) : super(key: key);

  @override
  _SignBiometricState createState() => _SignBiometricState();
}

class _SignBiometricState extends State<SignBiometric> {
  bool isHasBiometrics = false;
  TextEditingController controller = TextEditingController();
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

        if (isHasBiometrics) ...[
          Input(
            controller: controller,
            hintText: AppLocalizations.of(context)!.signInInputPassword,
            label: AppLocalizations.of(context)!.signInInputPassword,
            isPassword: true,
            errorMessage: AppLocalizations.of(
              context,
            )!.signInInputPasswordError,
          ),
          const SizedBox(height: 50),
        ],
        SizedBox(
          height: 48,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: Button(
                  onTap: () {
                    if (widget.formKey.currentState!.validate()) {
                      setState(() {
                        isHasBiometrics = true;
                      });
                    }
                  },
                  text: AppLocalizations.of(context)!.login,
                  icon: !isHasBiometrics
                      ? SvgPicture.asset(
                          'assets/icons/biometric.svg',
                          width: 18,
                          height: 18,
                        )
                      : null,
                ),
              ),
              if (isHasBiometrics) ...[
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 48,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onSurface,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: SizedBox(
                        height: 18,
                        width: 18,
                        child: SvgPicture.asset(
                          colorFilter: ColorFilter.mode(
                            Colors.black,
                            BlendMode.srcIn,
                          ),
                          'assets/icons/biometric.svg',
                          width: 18,
                          height: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 30),
        GestureDetector(
          onTap: () {
            widget.onChangeState();
          },
          child: TextView(text: AppLocalizations.of(context)!.signInNewUser),
        ),
      ],
    );
  }
}
