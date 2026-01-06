import 'package:ard_light/components/button.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PromotionalSet2 extends StatefulWidget {
  PromotionalSet2({Key? key}) : super(key: key);

  @override
  _PromotionalSetState createState() => _PromotionalSetState();
}

class _PromotionalSetState extends State<PromotionalSet2> {
  final List<dynamic> data = [
    'Хүүхдийн нэрийн данс',
    "Хүүхдийн хадгаламж",
    "Ard Pay цахим хэтэвч",
    "Хүүхдийн онлайн банк",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 5,
        right: 5,
        bottom: MediaQuery.of(context).viewInsets.bottom + 10,
      ),
      child: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: "13-18 настай хүүхдийн багц",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(height: 20),
                  for (int i = 0; i < data.length; i++) ...[
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green),
                        const SizedBox(width: 10),
                        TextView(text: data[i]),
                      ],
                    ),
                    if (i < data.length - 1) const SizedBox(height: 10),
                  ],
                  const SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    child: TextView(
                      text:
                          "Санамж: Багцад хүүхдийн Ard kids карт дагалдах ба бусад картыг салбар дээр ирэн захиалах боломжтой",
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Button(
            onTap: () {
              GoRouter.of(context).push('/auth/validateChild');
            },
            text: AppLocalizations.of(context)!.buyPromotionalSet,
          ),
        ],
      ),
    );
  }
}
