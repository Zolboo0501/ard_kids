import 'package:ard_light/components/button.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/features/auth/presentation/widget/bullet_point.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerifyDan extends StatefulWidget {
  final Function(int) onTabChange;

  const VerifyDan({Key? key, required this.onTabChange}) : super(key: key);

  @override
  _VerifyDanState createState() => _VerifyDanState();
}

class _VerifyDanState extends State<VerifyDan> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: AppLocalizations.of(context)!.verificationDanTitle,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                  const SizedBox(height: 20),
                  TextView(
                    text: AppLocalizations.of(
                      context,
                    )!.verificationDanDescription,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                  const SizedBox(height: 15),
                  BulletPoint(
                    text: AppLocalizations.of(context)!.verificationDanItem1,
                  ),
                  const SizedBox(height: 8),
                  BulletPoint(
                    text: AppLocalizations.of(context)!.verificationDanItem2,
                  ),
                  const SizedBox(height: 8),
                  BulletPoint(
                    text: AppLocalizations.of(context)!.verificationDanItem3,
                  ),
                  const SizedBox(height: 20),
                  TextView(
                    text: AppLocalizations.of(context)!.verificationDanFooter1,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                  const SizedBox(height: 15),
                  TextView(
                    text: AppLocalizations.of(context)!.verificationDanFooter2,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Button(
            onTap: () {
              widget.onTabChange(1);
            },
            text: AppLocalizations.of(context)!.verificationDanApprove,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 10),
          Button(
            onTap: () {
              GoRouter.of(context).pop();
            },
            text: AppLocalizations.of(context)!.verificationDanReject,
            color: Theme.of(context).colorScheme.secondary,
            titleColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
