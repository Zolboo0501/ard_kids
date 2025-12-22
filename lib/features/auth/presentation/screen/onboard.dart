import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/components/touchable_opacity.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ard_light/core/providers/language_provider.dart';

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
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemCount: data.length,
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
                    TouchableOpacity(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 48,
                          height: 48,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/globe.svg',
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      onTap: () {
                        _showLanguageDialog(context, ref);
                      },
                    ),
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

void _showLanguageDialog(BuildContext context, WidgetRef ref) {
  showModalBottomSheet(
    context: context,

    builder: (BuildContext dialogContext) {
      return Padding(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewPadding.bottom + 20,
          top: 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),

                  color: const Color(0xFFADADAD),
                ),
                width: 72,
                height: 6,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: TextView(
                text: AppLocalizations.of(context)!.chooseLanguage,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('Монгол'),
              onTap: () {
                ref
                    .read(languageProvider.notifier)
                    .setLanguage(const Locale('mn'));
                Navigator.pop(dialogContext);
              },
              trailing: const Icon(Icons.chevron_right_outlined, size: 24),
            ),
            ListTile(
              title: const Text('English'),
              onTap: () {
                ref
                    .read(languageProvider.notifier)
                    .setLanguage(const Locale('en'));
                Navigator.pop(dialogContext);
              },
              trailing: const Icon(Icons.chevron_right_outlined, size: 24),
            ),
          ],
        ),
      );
    },
  );
}
