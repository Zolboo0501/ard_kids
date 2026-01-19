import 'package:ard_light/components/Indicator_tab.dart';
import 'package:ard_light/components/custom_header.dart';
import 'package:ard_light/features/auth/presentation/tab/face_verification.dart';
import 'package:ard_light/features/auth/presentation/tab/update_information_succeed.dart';
import 'package:ard_light/features/auth/presentation/tab/verification_dan.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class UpdateInformation extends StatefulWidget {
  UpdateInformation({Key? key}) : super(key: key);

  @override
  _UpdateInformationState createState() => _UpdateInformationState();
}

class _UpdateInformationState extends State<UpdateInformation>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  double _currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.animation!.addListener(() {
      setState(() {
        _currentPage = _tabController.animation!.value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void onTabChange(int index) {
    _tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        isBack: true,
        title: AppLocalizations.of(context)!.signInUpdateInformation,
      ),
      body: SafeArea(
        child: IndicatorTab(
          tabController: _tabController,
          currentPage: _currentPage,
          child: [
            VerifyDan(onTabChange: onTabChange),
            FaceVerification(onTabChange: onTabChange),
            UpdateInformationSucceed(),
          ],
        ),
      ),
    );
  }
}
