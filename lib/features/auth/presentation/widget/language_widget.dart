import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/core/providers/language_provider.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageWidget extends ConsumerWidget {
  const LanguageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            child: TextView(
              text: AppLocalizations.of(context)!.chooseLanguage,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            title: const TextView(text: 'Монгол'),
            onTap: () {
              ref
                  .read(languageProvider.notifier)
                  .setLanguage(const Locale('mn'));
              Navigator.pop(context);
            },
            trailing: const Icon(Icons.chevron_right_outlined, size: 24),
          ),
          ListTile(
            title: const TextView(text: 'English'),
            onTap: () {
              ref
                  .read(languageProvider.notifier)
                  .setLanguage(const Locale('en'));
              Navigator.pop(context);
            },
            trailing: const Icon(Icons.chevron_right_outlined, size: 24),
          ),
        ],
      ),
    );
  }
}
