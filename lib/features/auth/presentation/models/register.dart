import 'package:flutter/material.dart';

class RegisterController {
  final TextEditingController familyNameController = TextEditingController();
  final TextEditingController parentNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  void dispose() {
    familyNameController.dispose();
    parentNameController.dispose();
    nameController.dispose();
  }
}
