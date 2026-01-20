import 'package:ard_light/components/Indicator_tab.dart';
import 'package:ard_light/components/custom_header.dart';
import 'package:ard_light/components/language_change.dart';
import 'package:ard_light/features/auth/presentation/tab/promotional_set.dart';
import 'package:ard_light/features/auth/presentation/tab/promotional_set2.dart';
import 'package:ard_light/features/auth/presentation/widget/question.dart';
import 'package:flutter/material.dart';

class RegisterChildrenStep extends StatefulWidget {
  RegisterChildrenStep({Key? key}) : super(key: key);

  @override
  _RegisterChildrenStepState createState() => _RegisterChildrenStepState();
}

class _RegisterChildrenStepState extends State<RegisterChildrenStep>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  double _currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.animation!.addListener(() {
      setState(() {
        _currentPage = _tabController.animation!.value;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: "",
        isBack: true,
        rightWidgets: [
          Question(isHasMarginRight: true, isHasBorder: true),
          LanguageChange(isHasMarginRight: true, isHasBorder: true),
        ],
      ),
      body: IndicatorTab(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        tabController: _tabController,
        currentPage: _currentPage,
        isHideStep: true,
        child: [PromotionalSet(), PromotionalSet2()],
      ),
    );
  }
}
