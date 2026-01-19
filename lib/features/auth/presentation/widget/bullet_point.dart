import 'package:ard_light/components/text_view.dart';
import 'package:flutter/material.dart';

class BulletPoint extends StatelessWidget {
  final String text;
  const BulletPoint({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextView(
            text: text,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
