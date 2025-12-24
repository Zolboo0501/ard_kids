import 'package:ard_light/components/custom_header.dart';
import 'package:ard_light/components/language_change.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/features/auth/presentation/widget/child.dart';
import 'package:ard_light/features/auth/presentation/widget/question.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class RegisterChildren extends StatefulWidget {
  RegisterChildren({Key? key}) : super(key: key);

  @override
  _RegisterChildrenState createState() => _RegisterChildrenState();
}

class _RegisterChildrenState extends State<RegisterChildren> {
  List<dynamic> children = [
    {"name": "У.Болд", "age": "13", "gender": 1, "register": "3Л00230454"},
    {"name": "У.Нархан", "age": "8", "gender": 2, "register": "3Л00230454"},
    {"name": "У.Сүхээ", "age": "6", "gender": 1, "register": "3Л00230454"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        isBack: true,
        rightWidgets: [
          Question(isHasMarginRight: true, isHasBorder: true),
          LanguageChange(isHasMarginRight: true, isHasBorder: true),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              TextView(
                text: AppLocalizations.of(context)!.registerChildrenTitle,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 15),
              TextView(
                text: AppLocalizations.of(context)!.registerChildrenDescription,
                fontSize: 14,
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Child(data: children[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemCount: children.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
