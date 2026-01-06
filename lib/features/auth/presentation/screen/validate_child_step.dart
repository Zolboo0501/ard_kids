import 'package:ard_light/components/Indicator_tab.dart';
import 'package:ard_light/components/custom_header.dart';
import 'package:ard_light/components/language_change.dart';
import 'package:ard_light/features/auth/presentation/models/auth/validate_address_model.dart';
import 'package:ard_light/features/auth/presentation/models/auth/validate_register_model.dart';
import 'package:ard_light/features/auth/presentation/tab/card_address.dart';
import 'package:ard_light/features/auth/presentation/tab/child_login_username.dart';
import 'package:ard_light/features/auth/presentation/tab/contract.dart';
import 'package:ard_light/features/auth/presentation/tab/validate_info.dart';
import 'package:ard_light/features/auth/presentation/tab/validate_mail.dart';
import 'package:ard_light/features/auth/presentation/tab/validate_phone.dart';
import 'package:ard_light/features/auth/presentation/widget/question.dart';
import 'package:flutter/material.dart';

class ValidateChildStep extends StatefulWidget {
  ValidateChildStep({Key? key}) : super(key: key);

  @override
  _ValidateChildStepState createState() => _ValidateChildStepState();
}

class _ValidateChildStepState extends State<ValidateChildStep>
    with SingleTickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _registerController = RegisterController();
  final _addressController = ValidateAddressModel();
  late TabController _tabController;
  double _currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
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

  void onSave(int step) {
    if (step < 6) {
      _tabController.animateTo(step);
    }
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
          child: [
            ValidateMail(onSave: onSave, controller: _emailController),
            ValidatePhone(onSave: onSave, controller: _phoneController),
            ValidateInfo(onSave: onSave, controller: _registerController),
            CardAddress(onSave: onSave, controller: _addressController),
            ChildLoginUsername(),
            Contract(),
          ],
        ),
      ),
    );
  }
}
