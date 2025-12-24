import 'package:ard_light/components/text_view.dart';
import 'package:flutter/material.dart';

class ValidateMail extends StatefulWidget {
  ValidateMail({Key? key}) : super(key: key);

  @override
  _ValidateMailState createState() => _ValidateMailState();
}

class _ValidateMailState extends State<ValidateMail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            text: "Хүүхдийн майл хаягыг оруулна уу",
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          const SizedBox(height: 25),
          TextView(
            text:
                "Та хүүхдийн майл хаяг оруулснаар бид тухайн хүүхдийн хаягийг баталгаажуулах юм.",
            fontSize: 14,
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
