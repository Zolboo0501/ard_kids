import 'package:ard_light/components/button.dart';
import 'package:ard_light/components/custom_header.dart';
import 'package:ard_light/components/dialog.dart';
import 'package:ard_light/components/input.dart';
import 'package:ard_light/components/language_change.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/features/auth/presentation/widget/question.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SetupPassword extends StatefulWidget {
  final Map<String, dynamic>? extra;

  SetupPassword({Key? key, this.extra}) : super(key: key);

  @override
  _SetupPasswordState createState() => _SetupPasswordState();
}

class _SetupPasswordState extends State<SetupPassword> {
  bool get isForget => widget.extra?['isForget'] ?? false;

  Map<String, dynamic> passwordValidation = {
    'length': false,
    'uppercase': false,
    'lowercase': false,
    'number': false,
    'special': false,
    'same': false,
  };

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    passwordController.addListener(_updateValidation);
    confirmPasswordController.addListener(_updateValidation);
  }

  @override
  void dispose() {
    passwordController.removeListener(_updateValidation);
    confirmPasswordController.removeListener(_updateValidation);
    super.dispose();
  }

  void _updateValidation() {
    String pass = passwordController.text;
    String confirm = confirmPasswordController.text;
    setState(() {
      passwordValidation['length'] = pass.length >= 8;
      passwordValidation['uppercase'] = RegExp(r'[A-Z]').hasMatch(pass);
      passwordValidation['lowercase'] = RegExp(r'[a-z]').hasMatch(pass);
      passwordValidation['number'] = RegExp(r'[0-9]').hasMatch(pass);
      passwordValidation['special'] = RegExp(
        r'[!@#$%^&*(),.?":{}|<>]',
      ).hasMatch(pass);
      passwordValidation['same'] = pass == confirm && pass.isNotEmpty;
    });
  }

  bool _allValid() {
    return passwordValidation.values.every((element) => element == true);
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
            bottom: MediaQuery.of(context).padding.bottom + 10,
          ),
          child: Column(
            children: [
              Expanded(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            text: isForget
                                ? "IsForget : true"
                                : "isForget : false",
                          ),
                          TextView(
                            text: AppLocalizations.of(
                              context,
                            )!.setupPasswordTitle,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          const SizedBox(height: 20),
                          Input(
                            controller: passwordController,
                            hintText: AppLocalizations.of(
                              context,
                            )!.setupPasswordHint,
                            label: AppLocalizations.of(context)!.setupPassword,
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(
                                  context,
                                )!.setupPasswordError;
                              }
                              if (!_allValid()) {
                                return 'Password does not meet all requirements';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          Input(
                            controller: confirmPasswordController,
                            hintText: AppLocalizations.of(
                              context,
                            )!.setupPasswordRepeatHint,
                            label: AppLocalizations.of(
                              context,
                            )!.setupPasswordRepeat,
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(
                                  context,
                                )!.setupPasswordRepeatError;
                              }
                              if (value != passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),

                          TextView(
                            text: AppLocalizations.of(
                              context,
                            )!.setupPasswordValidation,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          const SizedBox(height: 15),
                          Validation(
                            text: AppLocalizations.of(
                              context,
                            )!.setupPasswordCondition,
                            validate: passwordValidation['length']!,
                          ),
                          const SizedBox(height: 8),
                          Validation(
                            text: AppLocalizations.of(
                              context,
                            )!.setupPasswordCondition2,
                            validate: passwordValidation['uppercase']!,
                          ),
                          const SizedBox(height: 8),
                          Validation(
                            text: AppLocalizations.of(
                              context,
                            )!.setupPasswordCondition3,
                            validate: passwordValidation['lowercase']!,
                          ),
                          const SizedBox(height: 8),
                          Validation(
                            text: AppLocalizations.of(
                              context,
                            )!.setupPasswordCondition4,
                            validate: passwordValidation['number']!,
                          ),
                          const SizedBox(height: 8),
                          Validation(
                            text: AppLocalizations.of(
                              context,
                            )!.setupPasswordCondition5,
                            validate: passwordValidation['special']!,
                          ),
                          const SizedBox(height: 8),
                          Validation(
                            text: AppLocalizations.of(
                              context,
                            )!.setupPasswordCondition6,
                            validate: passwordValidation['same']!,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Button(
                onTap: () async {
                  if (_formKey.currentState!.validate() && _allValid()) {
                    if (isForget) {
                      await CustomDialog.success(
                        context,
                        title: AppLocalizations.of(
                          context,
                        )!.resetPasswordSuccess,
                        navigation: "/auth/signIn",
                      );
                    } else {
                      GoRouter.of(context).push('/auth/danSignUp');
                    }
                  }
                },
                text: AppLocalizations.of(context)!.buttonContinue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Validation extends StatelessWidget {
  String text;
  bool validate;
  Validation({Key? key, required this.text, required this.validate})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        validate
            ? SvgPicture.asset("assets/icons/check_circle.svg")
            : SvgPicture.asset("assets/icons/x_circle.svg"),
        const SizedBox(width: 4),
        TextView(text: text, fontSize: 14, fontWeight: FontWeight.w400),
      ],
    );
  }
}
