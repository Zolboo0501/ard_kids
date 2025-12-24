import 'package:ard_light/components/button.dart';
import 'package:ard_light/components/custom_header.dart';
import 'package:ard_light/components/language_change.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/features/auth/presentation/widget/question.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Onboard extends ConsumerStatefulWidget {
  Onboard({Key? key}) : super(key: key);

  @override
  ConsumerState<Onboard> createState() => _OnboardState();
}

class _OnboardState extends ConsumerState<Onboard> {
  int currentPage = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    List<dynamic> data = [
      {
        "image": "assets/images/Walkthrough-01.png",
        "title": AppLocalizations.of(context)!.onboardDescription,
        "description": AppLocalizations.of(context)!.onboardIntroduction,
      },

      {
        "image": "assets/images/Walkthrough-02.png",
        "title": AppLocalizations.of(context)!.onboardDescription2,
        "description": AppLocalizations.of(context)!.onboardIntroduction2,
      },

      {
        "image": "assets/images/Walkthrough-03.png",
        "title": AppLocalizations.of(context)!.onboardDescription3,
        "description": AppLocalizations.of(context)!.onboardIntroduction3,
      },
      {
        "image": "assets/images/Walkthrough-04.png",
        "title": AppLocalizations.of(context)!.onboardDescription4,
        "description": AppLocalizations.of(context)!.onboardIntroduction4,
      },

      {
        "image": "assets/images/Walkthrough-05.png",
        "title": AppLocalizations.of(context)!.onboardDescription5,
        "description": AppLocalizations.of(context)!.onboardIntroduction5,
      },
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: CustomHeader(
        title: "",
        rightWidgets: [
          Question(isHasMarginRight: true),
          LanguageChange(isHasMarginRight: true),
        ],
      ),
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemCount: data.length,
          onPageChanged: (int index) {
            setState(() {
              currentPage = index;
            });
          },
          itemBuilder: (context, index) {
            return (SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      data[index]['image'],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 400,
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          children: [
                            TextView(
                              textAlign: TextAlign.center,
                              text: data[index]['title'],
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                            const SizedBox(height: 15),
                            TextView(
                              textAlign: TextAlign.center,
                              text: data[index]['description'],
                              color: const Color(0x80000000),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),

                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            for (int i = 0; i < data.length; i++) ...[
                              Container(
                                width: 18,
                                height: 6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: currentPage == i
                                      ? Theme.of(context).colorScheme.onPrimary
                                      : const Color(0xFFADADAD),
                                ),
                              ),
                              if (i < data.length - 1) const SizedBox(width: 6),
                            ],
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: Button(
                                onTap: () {
                                  GoRouter.of(context).push('/auth/signIn');
                                },
                                text: AppLocalizations.of(context)!.login,
                                color: Theme.of(context).colorScheme.secondary,
                                titleColor: Theme.of(
                                  context,
                                ).colorScheme.onPrimary,
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Button(
                                onTap: () {
                                  GoRouter.of(context).push('/auth/signUp');
                                },
                                color: Theme.of(context).colorScheme.onPrimary,
                                text: AppLocalizations.of(context)!.register,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
          },
        ),
      ),
    );
  }
}
