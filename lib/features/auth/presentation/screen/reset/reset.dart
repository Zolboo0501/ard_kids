import 'package:ard_light/components/custom_header.dart';
import 'package:ard_light/components/language_change.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/core/theme/theme_extensions.dart';
import 'package:ard_light/features/auth/presentation/widget/question.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Reset extends StatelessWidget {
  Reset({Key? key}) : super(key: key);

  List<dynamic> screens = [
    {
      "icon": "assets/icons/password.svg",
      "title": "Нууц үг сэргээх",
      "navigate": "/auth/reset_password",
    },
    {
      "icon": "assets/icons/user2.svg",
      "title": "Нэвтрэх нэр сэргээх",
      "navigate": "/auth/reset_password",
    },
    {
      "icon": "assets/icons/identification-card.svg",
      "title": "Бүртгэл сэргээх ",
      "description": "Дан системийн нэвтрэлт",
      "navigate": "/auth/reset_password",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        isBack: true,
        title: "",
        rightWidgets: [
          Question(isHasMarginRight: true, isHasBorder: true),
          LanguageChange(isHasMarginRight: true, isHasBorder: true),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 10,
          bottom: MediaQuery.of(context).padding.bottom + 10,
          left: 15,
          right: 15,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
              ),
              child: TextView(
                text: AppLocalizations.of(context)!.resetTitle,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),

            Container(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  for (int i = 0; i < screens.length; i++) ...[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      screens[i]['icon'],
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: screens[i]['title'],
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                                    if (screens[i].containsKey(
                                      "description",
                                    )) ...[
                                      const SizedBox(height: 2),
                                      TextView(
                                        text: screens[i]["description"],
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: Theme.of(context)
                                            .extension<CustomColors>()!
                                            .textSubtlest,
                                      ),
                                    ],
                                  ],
                                ),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Theme.of(context).colorScheme.primary,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (i < screens.length - 1) const SizedBox(height: 15),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
