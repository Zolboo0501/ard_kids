import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_mn.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('mn'),
  ];

  /// Main title shown on the onboarding screen
  ///
  /// In en, this message translates to:
  /// **'All types of financial services'**
  String get onboardDescription;

  /// Introductory text explaining the app's features on the onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Savings, loans, investments, insurance and all financial services in one place.'**
  String get onboardIntroduction;

  /// Main title shown on the onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Ardcoin'**
  String get onboardDescription2;

  /// Introductory text explaining the app's features on the onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Use actively and get more rewards. All services come with Ardcoin rewards.'**
  String get onboardIntroduction2;

  /// Main title shown on the onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Crypto Trading'**
  String get onboardDescription3;

  /// Introductory text explaining the app's features on the onboarding screen
  ///
  /// In en, this message translates to:
  /// **'International crypto trading through your financial app.'**
  String get onboardIntroduction3;

  /// Main title shown on the onboarding screen
  ///
  /// In en, this message translates to:
  /// **'AI Financial Assistant'**
  String get onboardDescription4;

  /// Introductory text explaining the app's features on the onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Artificial intelligence powered financial assistant.'**
  String get onboardIntroduction4;

  /// Main title shown on the onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Strong. Together'**
  String get onboardDescription5;

  /// Introductory text explaining the app's features on the onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Stronger together.'**
  String get onboardIntroduction5;

  /// Introductory text explaining the app's features on the onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Choose Language'**
  String get chooseLanguage;

  /// Screen title for register header
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get headerTitleXyp;

  /// Screen title for register
  ///
  /// In en, this message translates to:
  /// **'Verify your information with XUR system'**
  String get titleXyp;

  /// Screen description for register
  ///
  /// In en, this message translates to:
  /// **'We will get your information from XUR system and verify it.'**
  String get descriptionXyp;

  /// Button text for login
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get login;

  /// Button text for register
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get register;

  /// Button text for register
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get registerButton;

  /// Alert title for register
  ///
  /// In en, this message translates to:
  /// **'Are you sure get information?'**
  String get registerVerifyAlertTitle;

  /// Alert subtitle for register
  ///
  /// In en, this message translates to:
  /// **'We get your information from Xyp system and verify it'**
  String get registerVerifyAlertSubtitle;

  /// Alert button title for register
  ///
  /// In en, this message translates to:
  /// **'Sure'**
  String get registerVerifyAlertButtonTitle;

  /// Alert button 2 title for register
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get registerVerifyAlertButtonTitle2;

  /// Register children screen title for register
  ///
  /// In en, this message translates to:
  /// **'Register Children'**
  String get registerChildrenHeaderTitle;

  /// Register children screen title for register
  ///
  /// In en, this message translates to:
  /// **'Information children'**
  String get registerChildrenTitle;

  /// Register children screen description for register
  ///
  /// In en, this message translates to:
  /// **'Please select the child for customer registration'**
  String get registerChildrenDescription;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'mn'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'mn':
      return AppLocalizationsMn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
