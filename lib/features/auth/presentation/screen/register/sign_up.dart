import 'package:ard_light/components/bottom_sheet.dart';
import 'package:ard_light/components/button.dart';
import 'package:ard_light/components/custom_header.dart';
import 'package:ard_light/components/input.dart';
import 'package:ard_light/components/language_change.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/features/auth/presentation/widget/%20countries.dart';
import 'package:ard_light/features/auth/presentation/widget/question.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Map<String, dynamic> country = {
    'name': 'Монгол Улс',
    'code': '+976',
    'flag': 'assets/icons/country.svg',
  };
  TextEditingController phoneController = TextEditingController();
  bool showError = false;

  void onChanged(Map<String, dynamic> value) {
    setState(() {
      country = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CustomHeader(
          isBack: true,
          title: "",
          rightWidgets: [
            Question(isHasMarginRight: true, isHasBorder: true),
            LanguageChange(isHasMarginRight: true, isHasBorder: true),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: AppLocalizations.of(context)!.signUpPhone,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 10),
                TextView(
                  text: AppLocalizations.of(context)!.signUpPhoneDescription,
                  fontSize: 14,
                ),
                const SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await CustomBottomSheet.show(
                              context: context,
                              child: CountriesView(
                                country: country,
                                onChanged: onChanged,
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 11,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Theme.of(context).colorScheme.secondary,
                              border: Border.all(
                                color: showError
                                    ? Theme.of(context).colorScheme.error
                                    : Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  country['flag'],
                                  width: 32,
                                  height: 32,
                                ),
                                const SizedBox(width: 5),
                                Icon(Icons.arrow_drop_down, size: 24),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),

                        Expanded(
                          child: Input(
                            controller: phoneController,
                            hintText: AppLocalizations.of(
                              context,
                            )!.signUpPhoneInputHint,
                            error: showError,
                            isPhone: true,
                            label: AppLocalizations.of(context)!.signUpPhone,
                          ),
                        ),
                      ],
                    ),

                    if (showError) ...[
                      const SizedBox(height: 10),
                      TextView(
                        text: AppLocalizations.of(context)!.signUpPhoneError,
                        color: Theme.of(context).colorScheme.error,
                        fontSize: 12,
                      ),
                    ],
                  ],
                ),
                Spacer(),
                Button(
                  text: AppLocalizations.of(context)!.buttonContinue,
                  onTap: () {
                    if (phoneController.text.isEmpty ||
                        country.isEmpty ||
                        phoneController.text.length < 8) {
                      setState(() {
                        showError = true;
                      });
                    } else {
                      GoRouter.of(context).push('/auth/otp');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
