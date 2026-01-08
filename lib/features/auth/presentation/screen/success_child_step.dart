import 'package:ard_light/components/button.dart';
import 'package:ard_light/components/custom_header.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SuccessChildStep extends StatelessWidget {
  const SuccessChildStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: AppLocalizations.of(context)!.registerChildrenHeaderTitle,
        isBack: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
              left: 15,
              right: 15,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/Success.svg",
                    width: 120,
                    height: 120,
                  ),
                  const SizedBox(height: 10),
                  TextView(
                    text: AppLocalizations.of(context)!.validateSuccessTitle,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  const SizedBox(height: 20),
                  TextView(
                    text: AppLocalizations.of(
                      context,
                    )!.validateSuccessDescription,
                    fontSize: 15,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: MediaQuery.of(context).padding.bottom + 10,
            ),
            child: Column(
              children: [
                Button(
                  onTap: () {
                    GoRouter.of(context).go("/auth/register-children");
                  },
                  text: AppLocalizations.of(context)!.validateSuccessButton,
                  color: Theme.of(context).colorScheme.secondary,
                  titleColor: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 10),
                Button(
                  onTap: () {},
                  text: AppLocalizations.of(context)!.validateSuccessButton2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
