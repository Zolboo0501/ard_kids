import 'package:ard_light/components/custom_header.dart';
import 'package:ard_light/components/language_change.dart';
import 'package:ard_light/components/tab_round.dart';
import 'package:ard_light/features/auth/presentation/tab/location.dart';
import 'package:ard_light/features/auth/presentation/tab/question.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  Question({Key? key}) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        isBack: true,
        rightWidgets: [
          LanguageChange(isHasMarginRight: true, isHasBorder: true),
        ],
      ),
      body: SafeArea(
        child: TabRound(
          tabPadding: EdgeInsets.all(12),
          tabDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          tabs: [
            AppLocalizations.of(context)!.branch,
            AppLocalizations.of(context)!.question,
          ],
          child: [LocationTab(), QuestionTab()],
        ),
      ),
    );
  }
}
