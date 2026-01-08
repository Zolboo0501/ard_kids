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

  /// Question tab title
  ///
  /// In en, this message translates to:
  /// **'Branch'**
  String get branch;

  /// Question tab title
  ///
  /// In en, this message translates to:
  /// **'Question'**
  String get question;

  /// Button text for see location
  ///
  /// In en, this message translates to:
  /// **'See location on map'**
  String get seeLocation;

  /// Button text for buy promotional set
  ///
  /// In en, this message translates to:
  /// **'Buy promotional set'**
  String get buyPromotionalSet;

  /// Screen title for validate mail
  ///
  /// In en, this message translates to:
  /// **'Please enter the child’s email address.'**
  String get validateMail;

  /// Screen title for validate mail
  ///
  /// In en, this message translates to:
  /// **'By entering the child’s email address, we will verify that address.'**
  String get validateMailDescription;

  /// Screen title for validate mail
  ///
  /// In en, this message translates to:
  /// **'Child’s registered email address'**
  String get validateMailInputLabel;

  /// Screen title for validate mail
  ///
  /// In en, this message translates to:
  /// **'Registered email address'**
  String get validateMailInputHint;

  /// Screen title for validate mail
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address.'**
  String get validateMailInputError;

  /// Screen title for validate phone
  ///
  /// In en, this message translates to:
  /// **'Please enter the child’s phone number.'**
  String get validatePhone;

  /// Screen title for validate phone
  ///
  /// In en, this message translates to:
  /// **'By entering the child’s phone number, we will verify that number.'**
  String get validatePhoneDescription;

  /// Screen title for validate phone
  ///
  /// In en, this message translates to:
  /// **'Child’s registered phone number'**
  String get validatePhoneInputLabel;

  /// Screen title for validate phone
  ///
  /// In en, this message translates to:
  /// **'Registered phone number'**
  String get validatePhoneInputHint;

  /// Screen title for validate phone error
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number.'**
  String get validatePhoneInputError;

  /// Button text for validate
  ///
  /// In en, this message translates to:
  /// **'Validate'**
  String get validate;

  /// Screen title for validate info
  ///
  /// In en, this message translates to:
  /// **'Verify child information'**
  String get validateInfo;

  /// Screen title for validate info
  ///
  /// In en, this message translates to:
  /// **'Please verify your child\'s information.'**
  String get validateInfoDescription;

  /// Validate child family name
  ///
  /// In en, this message translates to:
  /// **'Family name'**
  String get validateChildFamilyName;

  /// Validate child family name error
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid family name.'**
  String get validateChildFamilyNameError;

  /// Validate child parent name
  ///
  /// In en, this message translates to:
  /// **'Parent name'**
  String get validateChildParentName;

  /// Validate child parent name error
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid parent name.'**
  String get validateChildParentNameError;

  /// Validate child name
  ///
  /// In en, this message translates to:
  /// **'Child name'**
  String get validateChildName;

  /// Validate child name error
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid child name.'**
  String get validateChildNameError;

  /// Validate register number hint
  ///
  /// In en, this message translates to:
  /// **'Register number'**
  String get validateRegisterHint;

  /// Validate register number error
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid register number.'**
  String get validateRegisterHintError;

  /// Validate select a branch that accepts cards.
  ///
  /// In en, this message translates to:
  /// **'Select a branch that accepts cards.'**
  String get validateAddress;

  /// Validate select a branch that accepts cards.
  ///
  /// In en, this message translates to:
  /// **'Select a branch that accepts cards.'**
  String get validateAddressDescription;

  /// Validate address city
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get validateAddressCity;

  /// Validate address city error
  ///
  /// In en, this message translates to:
  /// **'Please select city.'**
  String get validateAddressCityError;

  /// Validate address district
  ///
  /// In en, this message translates to:
  /// **'District'**
  String get validateAddressDistrict;

  /// Validate address district error
  ///
  /// In en, this message translates to:
  /// **'Please select district.'**
  String get validateAddressDistrictError;

  /// Validate address branch
  ///
  /// In en, this message translates to:
  /// **'Branch'**
  String get validateAddressBranch;

  /// Validate address branch error
  ///
  /// In en, this message translates to:
  /// **'Please select branch.'**
  String get validateAddressBranchError;

  /// Validate address branch description
  ///
  /// In en, this message translates to:
  /// **'Branch description'**
  String get validateAddressBranchDescription;

  /// Validate address branch description error
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid branch description.'**
  String get validateAddressBranchDescriptionError;

  /// Validate login username
  ///
  /// In en, this message translates to:
  /// **'Please enter a your child login username'**
  String get validateLoginUsernameTitle;

  /// Validate login username
  ///
  /// In en, this message translates to:
  /// **'Login username'**
  String get validateLoginUsername;

  /// Validate login username error
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid login username.'**
  String get validateLoginUsernameError;

  /// Validate login username validation
  ///
  /// In en, this message translates to:
  /// **'You can only enter 7-20 characters of Latin letters, numbers and special characters.'**
  String get validateLoginUsernameValidation;

  /// Validate login username description
  ///
  /// In en, this message translates to:
  /// **'By entering the child’s login username, we will verify that account.'**
  String get validateLoginUsernameDescription;

  /// Validate contract approve
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get validateContractApprove;

  /// Validate contract reject
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get validateContractReject;

  /// Validate success title
  ///
  /// In en, this message translates to:
  /// **'Succeed'**
  String get validateSuccessTitle;

  /// Validate success description
  ///
  /// In en, this message translates to:
  /// **'Child\'s information has been successfully verified.'**
  String get validateSuccessDescription;

  /// Validate success button
  ///
  /// In en, this message translates to:
  /// **'Re-registering a child'**
  String get validateSuccessButton;

  /// Validate success button
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get validateSuccessButton2;

  /// Sign up phone
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get signUpPhone;

  /// Sign up phone input hint
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get signUpPhoneInputHint;

  /// Sign up phone description
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number to receive a verification code.'**
  String get signUpPhoneDescription;

  /// Sign up phone error
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number.'**
  String get signUpPhoneError;

  /// Button continue
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get buttonContinue;

  /// Setup password error
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get setupPasswordError;

  /// Setup password repeat error
  ///
  /// In en, this message translates to:
  /// **'Confirm password is required'**
  String get setupPasswordRepeatError;

  /// Setup password title
  ///
  /// In en, this message translates to:
  /// **'Create login password'**
  String get setupPasswordTitle;

  /// Setup password
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get setupPassword;

  /// Setup password repeat
  ///
  /// In en, this message translates to:
  /// **'Repeat password'**
  String get setupPasswordRepeat;

  /// Setup password hint
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get setupPasswordHint;

  /// Setup password repeat
  ///
  /// In en, this message translates to:
  /// **'Enter password again'**
  String get setupPasswordRepeatHint;

  /// Setup password validation
  ///
  /// In en, this message translates to:
  /// **'The password must meet the following requirements:'**
  String get setupPasswordValidation;

  /// Set up password condition
  ///
  /// In en, this message translates to:
  /// **'Use 8 or more characters.'**
  String get setupPasswordCondition;

  /// Set up password condition
  ///
  /// In en, this message translates to:
  /// **'Use uppercase letters.'**
  String get setupPasswordCondition2;

  /// Set up password condition
  ///
  /// In en, this message translates to:
  /// **'Use lowercase letters.'**
  String get setupPasswordCondition3;

  /// Set up password condition
  ///
  /// In en, this message translates to:
  /// **'Use numbers.'**
  String get setupPasswordCondition4;

  /// Set up password condition
  ///
  /// In en, this message translates to:
  /// **'Use special characters.'**
  String get setupPasswordCondition5;

  /// Set up password condition
  ///
  /// In en, this message translates to:
  /// **'Password and repeat password same or not.'**
  String get setupPasswordCondition6;

  /// Invitation code title
  ///
  /// In en, this message translates to:
  /// **'Please enter the referral code of the person who invited you.'**
  String get invitationCodeTitle;

  /// Invitation code input
  ///
  /// In en, this message translates to:
  /// **'Referral code'**
  String get invitationCodeInput;

  /// Otp verify title
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get otpVerifyTitle;

  /// Otp verify description
  ///
  /// In en, this message translates to:
  /// **'We sent a verification code to your {value} verify 4 digits code and confirm your identity.'**
  String otpVerifyDescription(String value);

  /// Otp verify time
  ///
  /// In en, this message translates to:
  /// **'Time {time}'**
  String otpVerifyTime(String time);

  /// Otp verification error
  ///
  /// In en, this message translates to:
  /// **'Verification code is wrong or expired.'**
  String get otpVerificationError;

  /// Otp minutes
  ///
  /// In en, this message translates to:
  /// **'min'**
  String get otpMinutes;

  /// Otp seconds
  ///
  /// In en, this message translates to:
  /// **'sec'**
  String get otpSeconds;

  /// Otp resend
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get otpResend;
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
