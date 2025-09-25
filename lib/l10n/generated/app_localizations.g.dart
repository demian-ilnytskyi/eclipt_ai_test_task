import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.g.dart';
import 'app_localizations_uk.g.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.g.dart';
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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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
    Locale('uk')
  ];

  /// The button is used to go to the Login page.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Field used for search.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get search;

  /// The button is used to hide part of the text in the subtitle.
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get hide;

  /// The button is used to expand the full text in the subtitle.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// The button is used to scroll to the project information section.
  ///
  /// In en, this message translates to:
  /// **'Detail'**
  String get detail;

  /// The button is used to reset all applied filters.
  ///
  /// In en, this message translates to:
  /// **'Reset all'**
  String get resetAll;

  /// The button is used to go to the AboutUs page.
  ///
  /// In en, this message translates to:
  /// **'About project'**
  String get aboutUs;

  /// The button is used to go to the Story page.
  ///
  /// In en, this message translates to:
  /// **'Stories'**
  String get stories;

  /// The button is used to go to the Discounts page.
  ///
  /// In en, this message translates to:
  /// **'Discounts'**
  String get discounts;

  /// The button is used to go to the Profile page.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get myProfile;

  /// The button is used to go to the Work page.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get work;

  /// The button is used to go to the Information page.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get information;

  /// The button is used to go to the Consultation page.
  ///
  /// In en, this message translates to:
  /// **'Consultation'**
  String get consultationOnline;

  /// No description provided for @respond.
  ///
  /// In en, this message translates to:
  /// **'Respond'**
  String get respond;

  /// Fields used to enter email. Part of the error output if the data in the field is incorrect.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// If the Check widget has a checkmark, it means that the action is done anonymously.
  ///
  /// In en, this message translates to:
  /// **'Anonymous'**
  String get beAnonymous;

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get errorTitle;

  /// No description provided for @errorMessage.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while loading the page'**
  String get errorMessage;

  /// The button is used to send data when the form is filled out.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// The button used to navigate to the MyStory page.
  ///
  /// In en, this message translates to:
  /// **'My story'**
  String get myStory;

  /// The button used to navigate to the Saves page.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get saved;

  /// The button used to navigate to the My Publications page.
  ///
  /// In en, this message translates to:
  /// **'My discounts'**
  String get myDiscounts;

  /// No description provided for @profileDetails.
  ///
  /// In en, this message translates to:
  /// **'You can add/edit personal information, manage anonymous setting, and find your saved content.'**
  String get profileDetails;

  /// No description provided for @beAnonymousDetails.
  ///
  /// In en, this message translates to:
  /// **'If you make your profile anonymous, your page will not display personal information, only your nickname.'**
  String get beAnonymousDetails;

  /// Field used to enter a first name.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get writeYouName;

  /// Field used to enter the Last Name.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get writeYouLastName;

  /// Button used to save changes to the profile subtitle.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveChanges;

  /// The button is used to edit the profile subtitle.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get editData;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get lastName;

  /// The button is used to add test data to Firebase.
  ///
  /// In en, this message translates to:
  /// **'No data found, click to add test data once'**
  String get getMockData;

  /// The button is used to go to the Investors page.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get investors;

  /// No description provided for @investorsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Support veterans and their families. Business owners, offer discounts or personalized offers for veterans. Contact us to discuss details.'**
  String get investorsSubtitle;

  /// No description provided for @feedback.
  ///
  /// In en, this message translates to:
  /// **'Feedback'**
  String get feedback;

  /// No description provided for @feedbackSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Can\'t find what you need? Have questions or requests? Fill out the form below. We\'re here to help!'**
  String get feedbackSubtitle;

  /// Field used to enter a message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get writeYourMessage;

  /// No description provided for @homeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'On our website you will find current discounts from businesses for you and your families.'**
  String get homeSubtitle;

  /// The button is used to clear all fields of the form.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @fieldCannotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Field cannot be empty'**
  String get fieldCannotBeEmpty;

  /// No description provided for @tooshort.
  ///
  /// In en, this message translates to:
  /// **'too short, it must contain {number} characters'**
  String tooshort(int number);

  /// No description provided for @tooShortEmail.
  ///
  /// In en, this message translates to:
  /// **'Too short, it must contain at least {number} characters'**
  String tooShortEmail(int number);

  /// No description provided for @tooShortPassword.
  ///
  /// In en, this message translates to:
  /// **'Too short, it must contain at least {number} characters'**
  String tooShortPassword(int number);

  /// No description provided for @isWrong.
  ///
  /// In en, this message translates to:
  /// **'has errors'**
  String get isWrong;

  /// No description provided for @isWrongEmail.
  ///
  /// In en, this message translates to:
  /// **'is not properly formatted'**
  String get isWrongEmail;

  /// No description provided for @isWrongCode.
  ///
  /// In en, this message translates to:
  /// **'is not properly formatted'**
  String get isWrongCode;

  /// No description provided for @isWrongReport.
  ///
  /// In en, this message translates to:
  /// **'The message should contain only letters'**
  String get isWrongReport;

  /// Button used to log out of the account.
  ///
  /// In en, this message translates to:
  /// **' Log out'**
  String get logOut;

  /// Button used to delete an account.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteAccount;

  /// The button used to go to the SignUp page.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @fullEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get fullEmail;

  /// The button is used to proceed to account registration.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @doYouHavenAccount.
  ///
  /// In en, this message translates to:
  /// **'Have an account'**
  String get doYouHavenAccount;

  /// No description provided for @donotYouHavenAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get donotYouHavenAccount;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @signUpWith.
  ///
  /// In en, this message translates to:
  /// **'Sign up with'**
  String get signUpWith;

  /// Button used to sign up/login with google.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get google;

  /// Button used to sign up/login with facebook.
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get facebook;

  /// Button used to sign up/login with apple.
  ///
  /// In en, this message translates to:
  /// **'Apple'**
  String get apple;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Field used to enter a password.
  ///
  /// In en, this message translates to:
  /// **'Create a secure password'**
  String get createSecurePassword;

  /// No description provided for @capitalLetter.
  ///
  /// In en, this message translates to:
  /// **'must contain one or more capital letter'**
  String get capitalLetter;

  /// No description provided for @oneNumber.
  ///
  /// In en, this message translates to:
  /// **'must contain one or more number'**
  String get oneNumber;

  /// No description provided for @informationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find verified help information. Use filters for convenience.'**
  String get informationSubtitle;

  /// Button used to load new news items on the computer version.
  ///
  /// In en, this message translates to:
  /// **'More news'**
  String get moreNews;

  /// The button is used to go to the fund's website.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @fundsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Support veterans with deeds, not just words. Donate to these proven foundations. Every donation counts.'**
  String get fundsSubtitle;

  /// No description provided for @thankYou.
  ///
  /// In en, this message translates to:
  /// **'Thank you'**
  String get thankYou;

  /// No description provided for @businessDashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get businessDashboard;

  /// No description provided for @feedbackBoxSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We\'ve received your message and will respond soon.'**
  String get feedbackBoxSubtitle;

  /// The button is used to allow the user to send the message again.
  ///
  /// In en, this message translates to:
  /// **'Send more'**
  String get sendMore;

  /// No description provided for @linkedAccounts.
  ///
  /// In en, this message translates to:
  /// **'Linked accounts'**
  String get linkedAccounts;

  /// No description provided for @linkedAccountsDetails.
  ///
  /// In en, this message translates to:
  /// **'Your Veteran account is linked to a Facebook account.'**
  String get linkedAccountsDetails;

  /// The button is used to disconnect the user's account from: google, facebook, apple
  ///
  /// In en, this message translates to:
  /// **'Disconnect'**
  String get disconnect;

  /// No description provided for @logInWith.
  ///
  /// In en, this message translates to:
  /// **'Log in with'**
  String get logInWith;

  /// The form is used to rate a website.
  ///
  /// In en, this message translates to:
  /// **'Rate our site'**
  String get rateOurSite;

  /// The button is used to move to the next field
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @thankYouDescription.
  ///
  /// In en, this message translates to:
  /// **'Please note! To access some services, you may need to confirm your identity.'**
  String get thankYouDescription;

  /// No description provided for @businessDashboardDescription.
  ///
  /// In en, this message translates to:
  /// **'Hello! On this page you can manage your discounts.'**
  String get businessDashboardDescription;

  /// The button is used to go to the Home page.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get mainScreen;

  /// No description provided for @dublicate.
  ///
  /// In en, this message translates to:
  /// **'A user with this password or email exists'**
  String get dublicate;

  /// No description provided for @fillInForm.
  ///
  /// In en, this message translates to:
  /// **'Fill in the form'**
  String get fillInForm;

  /// No description provided for @questionsFormSubtitle.
  ///
  /// In en, this message translates to:
  /// **'To provide the best service, please answer the following question(s):'**
  String get questionsFormSubtitle;

  /// No description provided for @selectAppropriateOne.
  ///
  /// In en, this message translates to:
  /// **'Select the appropriate one:'**
  String get selectAppropriateOne;

  /// No description provided for @iAmVeteran.
  ///
  /// In en, this message translates to:
  /// **'I am a veteran'**
  String get iAmVeteran;

  /// No description provided for @iAmRelativeOfVeteran.
  ///
  /// In en, this message translates to:
  /// **'Family member of a veteran'**
  String get iAmRelativeOfVeteran;

  /// No description provided for @iAmCivilian.
  ///
  /// In en, this message translates to:
  /// **'Civilian'**
  String get iAmCivilian;

  /// No description provided for @iAmBusinessOwnerRepresentative.
  ///
  /// In en, this message translates to:
  /// **'Business owner/representative, Looking to help veterans.'**
  String get iAmBusinessOwnerRepresentative;

  /// No description provided for @workSubtitle.
  ///
  /// In en, this message translates to:
  /// **'In this section, you will find current vacancies, and you can also leave a request to help us with your search. For your convenience, you can use filters.'**
  String get workSubtitle;

  /// The button is used to go to the Employee page.
  ///
  /// In en, this message translates to:
  /// **'Looking for a job'**
  String get lookingForJob;

  /// The button is used to go to the Employer page.
  ///
  /// In en, this message translates to:
  /// **'Giving a job'**
  String get givingJob;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumber;

  /// Button used to load news discounts on the desktop version.
  ///
  /// In en, this message translates to:
  /// **'More discounts'**
  String get moreDiscounts;

  /// No description provided for @discountsAndCoupons.
  ///
  /// In en, this message translates to:
  /// **'Discounts and coupons'**
  String get discountsAndCoupons;

  /// No description provided for @discountsAndCouponsDescription.
  ///
  /// In en, this message translates to:
  /// **'In this section you can find discounts and coupons from our partners. For your convenience, you can use filters.'**
  String get discountsAndCouponsDescription;

  /// No description provided for @resume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get resume;

  /// No description provided for @noResume.
  ///
  /// In en, this message translates to:
  /// **'I don\'t have a resume'**
  String get noResume;

  /// Button used to return to the previous page.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// The button is used to send a request and go to the Congratulations page.
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get upload;

  /// No description provided for @employerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'In this section you can employ a veteran. If you have an open vacancy in your company, you can place an ad here.'**
  String get employerSubtitle;

  /// No description provided for @mainInformation.
  ///
  /// In en, this message translates to:
  /// **'Main information'**
  String get mainInformation;

  /// No description provided for @position.
  ///
  /// In en, this message translates to:
  /// **'Position'**
  String get position;

  /// Field used to enter a position.
  ///
  /// In en, this message translates to:
  /// **'Write the proposed position'**
  String get writeProposedPosition;

  /// No description provided for @wage.
  ///
  /// In en, this message translates to:
  /// **'Salary'**
  String get wage;

  /// Field used to enter a salary.
  ///
  /// In en, this message translates to:
  /// **'Write the salary'**
  String get writeTheWage;

  /// No description provided for @selectCityOfWork.
  ///
  /// In en, this message translates to:
  /// **'Select the city of work'**
  String get selectCityOfWork;

  /// Field used to select or enter a city.
  ///
  /// In en, this message translates to:
  /// **'Select a city'**
  String get selectCity;

  /// The button is used to go to the COntact page.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get contacts;

  /// Field used to enter contacts.
  ///
  /// In en, this message translates to:
  /// **'Write how to contact you'**
  String get howToContactYou;

  /// No description provided for @remotely.
  ///
  /// In en, this message translates to:
  /// **'Remotely'**
  String get remotely;

  /// The button used to go to the MyFeedback page.
  ///
  /// In en, this message translates to:
  /// **'My feedback'**
  String get myFeedback;

  /// No description provided for @didNotFindYourVacancy.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t find your vacancy?'**
  String get didNotFindYourVacancy;

  /// No description provided for @workRequestSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We can help. Fill in your details and job preferences in the following form and we will send your CV to relevant companies.'**
  String get workRequestSubtitle;

  /// Button used to go to the Request page.
  ///
  /// In en, this message translates to:
  /// **'Leave a request'**
  String get leaveRequest;

  /// No description provided for @savesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'In this section, you can see all your saved materials'**
  String get savesSubtitle;

  /// No description provided for @storySubtitle.
  ///
  /// In en, this message translates to:
  /// **'In this section, you can share your life and service stories anonymously or openly. You can also support other participants.'**
  String get storySubtitle;

  /// Field used to enter a story.
  ///
  /// In en, this message translates to:
  /// **'Write your story'**
  String get writeYourStory;

  /// The button is used to download the discounted stories on the desktop version.
  ///
  /// In en, this message translates to:
  /// **'More stories'**
  String get moreStories;

  /// The button used to go to the AddStory page.
  ///
  /// In en, this message translates to:
  /// **'Add your story'**
  String get addYourStory;

  /// No description provided for @yourStory.
  ///
  /// In en, this message translates to:
  /// **'Your story'**
  String get yourStory;

  /// No description provided for @addPhoto.
  ///
  /// In en, this message translates to:
  /// **'Add Photo'**
  String get addPhoto;

  /// No description provided for @notNecessarily.
  ///
  /// In en, this message translates to:
  /// **'(not necessarily)'**
  String get notNecessarily;

  /// No description provided for @publishAnonymously.
  ///
  /// In en, this message translates to:
  /// **'Publish anonymously'**
  String get publishAnonymously;

  /// No description provided for @anonymous.
  ///
  /// In en, this message translates to:
  /// **'Anonymous'**
  String get anonymous;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @publishAnonymouslyStorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'If you post a story anonymously, readers will only be able to see your nickname in your profile.'**
  String get publishAnonymouslyStorySubtitle;

  /// The button is used to publish a story and go to the Story page.
  ///
  /// In en, this message translates to:
  /// **'Publish'**
  String get publish;

  /// No description provided for @storyAddSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Share your story and we will publish it on our website. All stories are moderated and will be published after review.'**
  String get storyAddSubtitle;

  /// The button is used to confirm logging out/deleting an account and going to the Home page.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// The button is used to refuse to log out/delete the account and go to the Home page.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// The button is used to go to the previous page with works.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @myStoryDetails.
  ///
  /// In en, this message translates to:
  /// **'In this section you can manage your stories.'**
  String get myStoryDetails;

  /// No description provided for @whatKindOfProject.
  ///
  /// In en, this message translates to:
  /// **'What kind of project it is?'**
  String get whatKindOfProject;

  /// No description provided for @aboutProject.
  ///
  /// In en, this message translates to:
  /// **'Veteranam is a platform to support veterans and their families. We post information about discounts and services to help veterans with their daily lives and development.'**
  String get aboutProject;

  /// No description provided for @saveMoney.
  ///
  /// In en, this message translates to:
  /// **'To save money'**
  String get saveMoney;

  /// No description provided for @discountsServices.
  ///
  /// In en, this message translates to:
  /// **'Discounts'**
  String get discountsServices;

  /// No description provided for @discountsServicesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Here you will find current offers for veterans and their families that are updated monthly. Medical, service, catering, and clothing discounts are all available in this section.'**
  String get discountsServicesSubtitle;

  /// The button used to go to the Discounts page.
  ///
  /// In en, this message translates to:
  /// **'discounts'**
  String get toDiscounts;

  /// No description provided for @findOut.
  ///
  /// In en, this message translates to:
  /// **'To find out'**
  String get findOut;

  /// No description provided for @informationNews.
  ///
  /// In en, this message translates to:
  /// **'Information and news'**
  String get informationNews;

  /// No description provided for @informationNewsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'All information in one place. We have analyzed various resources and highlighted the rights and benefits for veterans in this section. It contains systematized data - the most important things a veteran needs to know. In this section, you can learn more about the guarantees provided by the state to veterans.'**
  String get informationNewsSubtitle;

  /// Button used to go to the Information page.
  ///
  /// In en, this message translates to:
  /// **'To information'**
  String get toInfomation;

  /// No description provided for @whatYouMostInterestedIn.
  ///
  /// In en, this message translates to:
  /// **'What you are most interested in'**
  String get whatYouMostInterestedIn;

  /// No description provided for @answersYourQuestions.
  ///
  /// In en, this message translates to:
  /// **'Answers to your questions'**
  String get answersYourQuestions;

  /// No description provided for @questionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t find what you were looking for, want to get in touch, or have questions or requests? We are happy to talk to you! Please fill out the form below.'**
  String get questionSubtitle;

  /// The button is used to go to the Feedback page.
  ///
  /// In en, this message translates to:
  /// **'Write message'**
  String get writeMessage;

  /// No description provided for @doYouWantSupportOurProject.
  ///
  /// In en, this message translates to:
  /// **'Do you want to support our project?'**
  String get doYouWantSupportOurProject;

  /// No description provided for @allRightsReserved.
  ///
  /// In en, this message translates to:
  /// **'All rights reserved'**
  String get allRightsReserved;

  /// Button used to open the PrivacyPolicy dialoge.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicy;

  /// Button used to open the PrivacyPolicy dialoge.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicy2;

  /// No description provided for @sections.
  ///
  /// In en, this message translates to:
  /// **'Sections'**
  String get sections;

  /// The button is used to go to the Contact page.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @jobsVacancies.
  ///
  /// In en, this message translates to:
  /// **'Jobs and vacancies'**
  String get jobsVacancies;

  /// No description provided for @jobsVacanciesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Information on current vacancies specifically targeted at veterans, as well as resources for job search and career development.'**
  String get jobsVacanciesSubtitle;

  /// Button used to go to the Work page.
  ///
  /// In en, this message translates to:
  /// **'To vacancies'**
  String get toVacancy;

  /// No description provided for @toGetItYouNeed.
  ///
  /// In en, this message translates to:
  /// **'To get it you need:'**
  String get toGetItYouNeed;

  /// No description provided for @write.
  ///
  /// In en, this message translates to:
  /// **'Write'**
  String get write;

  /// No description provided for @aMessage.
  ///
  /// In en, this message translates to:
  /// **'a message'**
  String get aMessage;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @us.
  ///
  /// In en, this message translates to:
  /// **'us'**
  String get us;

  /// No description provided for @preferEmail.
  ///
  /// In en, this message translates to:
  /// **'Prefer email?'**
  String get preferEmail;

  /// No description provided for @ourSocialNetworks.
  ///
  /// In en, this message translates to:
  /// **'Our social networks'**
  String get ourSocialNetworks;

  /// No description provided for @feedbackFormSubtitle.
  ///
  /// In en, this message translates to:
  /// **'By submitting this form, I accept the Privacy Policy of this site'**
  String get feedbackFormSubtitle;

  /// The button is used to send data when the form is filled out.
  ///
  /// In en, this message translates to:
  /// **'Send message'**
  String get sendMessage;

  /// No description provided for @provideSuggestionsFromBusinesses.
  ///
  /// In en, this message translates to:
  /// **'Provide suggestions from businesses,'**
  String get provideSuggestionsFromBusinesses;

  /// No description provided for @orDonateHere.
  ///
  /// In en, this message translates to:
  /// **'or donate here'**
  String get orDonateHere;

  /// No description provided for @supportOurVeterans.
  ///
  /// In en, this message translates to:
  /// **'Support our veterans'**
  String get supportOurVeterans;

  /// Button used to navigate to the Investors page.
  ///
  /// In en, this message translates to:
  /// **'SUPPORT\nVETERANS'**
  String get supportVeterans;

  /// The button is used to go to the Contact page.
  ///
  /// In en, this message translates to:
  /// **'HAVE\nQUESTIONS?'**
  String get haveQuestions;

  /// No description provided for @donateHere.
  ///
  /// In en, this message translates to:
  /// **'Donate here'**
  String get donateHere;

  /// No description provided for @provenFunds.
  ///
  /// In en, this message translates to:
  /// **'Proven funds'**
  String get provenFunds;

  /// The button is used to go to the Home page.
  ///
  /// In en, this message translates to:
  /// **'Try it again'**
  String get tryItAgain;

  /// No description provided for @companyIsHidden.
  ///
  /// In en, this message translates to:
  /// **'The company is hidden'**
  String get companyIsHidden;

  /// No description provided for @allUkrainOnline.
  ///
  /// In en, this message translates to:
  /// **'All of Ukraine (online)'**
  String get allUkrainOnline;

  /// The button is used to load funds on the computer version.
  ///
  /// In en, this message translates to:
  /// **'More funds'**
  String get moreFunds;

  /// The button is used to go to the MyDiscounts page.
  ///
  /// In en, this message translates to:
  /// **'Offer a discount'**
  String get offerDiscount;

  /// No description provided for @myDiscountsAndCoupons.
  ///
  /// In en, this message translates to:
  /// **'In this section, you can publish a discount, as well as manage your publications. If your company provides personalized offers for veterans, you can advertise here.'**
  String get myDiscountsAndCoupons;

  /// No description provided for @myPublications.
  ///
  /// In en, this message translates to:
  /// **'My publications'**
  String get myPublications;

  /// The button is used to deactivate a discount created by the user.
  ///
  /// In en, this message translates to:
  /// **'Deactivate'**
  String get deactivate;

  /// No description provided for @statistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// The button is used to open an AdvancedFilter or open a dialoge with it.
  ///
  /// In en, this message translates to:
  /// **'Advanced filter'**
  String get advancedFilter;

  /// The button is used to open filter dialoge.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// The button is used to open the filter menu.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get sort;

  /// No description provided for @specialOffers.
  ///
  /// In en, this message translates to:
  /// **'Special offers'**
  String get specialOffers;

  /// No description provided for @forVeteransAndTheirFamilies.
  ///
  /// In en, this message translates to:
  /// **'for veterans and their families'**
  String get forVeteransAndTheirFamilies;

  /// No description provided for @discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discount;

  /// No description provided for @filterApplied.
  ///
  /// In en, this message translates to:
  /// **'Filter applied'**
  String get filterApplied;

  /// The button is used to apply and deactivate a filter by discount value.
  ///
  /// In en, this message translates to:
  /// **'by descending'**
  String get fromLargestToSmallest;

  /// The button is used to apply and deactivate a filter where the discount is 100%.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get free;

  /// The button is used to apply and deactivate a filter where a discount is applied in many cities.
  ///
  /// In en, this message translates to:
  /// **'All establishments of the chain'**
  String get allStoresOfChain;

  /// The button is used to deactivate category filtering.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// The button is used to open the Report dialog.
  ///
  /// In en, this message translates to:
  /// **'Complaint'**
  String get complaint;

  /// No description provided for @reportPublication.
  ///
  /// In en, this message translates to:
  /// **'Report a publication'**
  String get reportPublication;

  /// No description provided for @specifyReasonForComplaint.
  ///
  /// In en, this message translates to:
  /// **'Specify the reason for the complaint:'**
  String get specifyReasonForComplaint;

  /// The button is used to select the type of complaint.
  ///
  /// In en, this message translates to:
  /// **'Fraud or spam;'**
  String get fraudOrSpam;

  /// The button is used to select the type of complaint.
  ///
  /// In en, this message translates to:
  /// **'Fake news or disinformation;'**
  String get fakeNewsOrDisinformation;

  /// The button is used to select the type of complaint.
  ///
  /// In en, this message translates to:
  /// **'Offensive or hateful content;'**
  String get offensiveOrHatefulContent;

  /// The button is used to select the type of complaint.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @addComment.
  ///
  /// In en, this message translates to:
  /// **'Add a comment (optional):'**
  String get addComment;

  /// No description provided for @addEmailAndMessage.
  ///
  /// In en, this message translates to:
  /// **'Add a email and message (optional):'**
  String get addEmailAndMessage;

  /// No description provided for @checkPointError.
  ///
  /// In en, this message translates to:
  /// **'Please select one of the following answers'**
  String get checkPointError;

  /// No description provided for @verifiedInformation.
  ///
  /// In en, this message translates to:
  /// **'Verified information'**
  String get verifiedInformation;

  /// No description provided for @thatEndOfList.
  ///
  /// In en, this message translates to:
  /// **'That\'s the end of the list! We hope you found what you were looking for.'**
  String get thatEndOfList;

  /// Button used to return to the previous top of the page.
  ///
  /// In en, this message translates to:
  /// **'Return to the top'**
  String get returnToTop;

  /// No description provided for @cardListEmptyText.
  ///
  /// In en, this message translates to:
  /// **'Sorry, nothing was found using your filters. Try changing your search criteria'**
  String get cardListEmptyText;

  /// No description provided for @ofUpTo.
  ///
  /// In en, this message translates to:
  /// **'up to'**
  String get ofUpTo;

  /// Button used to navigate to the Disocunt page.
  ///
  /// In en, this message translates to:
  /// **'FIND YOUR DISCOUNT'**
  String get findYourDiscount;

  /// Button used to navigate to the Disocunt page.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @callForDetails.
  ///
  /// In en, this message translates to:
  /// **'Call for details'**
  String get callForDetails;

  /// No description provided for @veterans.
  ///
  /// In en, this message translates to:
  /// **'Veterans'**
  String get veterans;

  /// No description provided for @theirFamilies.
  ///
  /// In en, this message translates to:
  /// **'Their Families'**
  String get theirFamilies;

  /// No description provided for @activeMilitary.
  ///
  /// In en, this message translates to:
  /// **'Active Military'**
  String get activeMilitary;

  /// No description provided for @militaryDoctors.
  ///
  /// In en, this message translates to:
  /// **'Military Doctors'**
  String get militaryDoctors;

  /// No description provided for @itIsValidAllTime.
  ///
  /// In en, this message translates to:
  /// **'It is valid all the time'**
  String get itIsValidAllTime;

  /// message of an unforeseen error that was not foreseen.
  ///
  /// In en, this message translates to:
  /// **'We\'re sorry, there was an unforeseen error.'**
  String get error;

  /// error message when connecting to the Internet connection
  ///
  /// In en, this message translates to:
  /// **'There is no internet connection. Please check your connection.'**
  String get networkFailure;

  /// error message when trying to download data from firebase
  ///
  /// In en, this message translates to:
  /// **'An error occurred while loading some data.'**
  String get getFailure;

  /// error message when trying to send data to firebase
  ///
  /// In en, this message translates to:
  /// **'We\'re sorry, there was an unforeseen error while sending the data. Please try again later.'**
  String get sendFailure;

  /// error message when you try to log in to your account using incorrect data
  ///
  /// In en, this message translates to:
  /// **'The user with this password or address does not exist.'**
  String get notFoundFailure;

  /// an error message when trying to register an account with the same email as an already registered account
  ///
  /// In en, this message translates to:
  /// **'The user with Email exist.'**
  String get dublicateFailure;

  /// The button is used to add a like to a card.
  ///
  /// In en, this message translates to:
  /// **'Useful'**
  String get useful;

  /// The button is used to share the card data.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// The button is used to save the card in the save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// The button is used to go to the website that is attached to the card.
  ///
  /// In en, this message translates to:
  /// **'Web site'**
  String get webSite;

  /// No description provided for @hideExpansion.
  ///
  /// In en, this message translates to:
  /// **'hide...'**
  String get hideExpansion;

  /// No description provided for @discountLinkTitle.
  ///
  /// In en, this message translates to:
  /// **'Do you know about discounts that are not yet available on our website? Send us the link and we\'ll add them as soon as possible.'**
  String get discountLinkTitle;

  /// No description provided for @invalidLink.
  ///
  /// In en, this message translates to:
  /// **'Invalid link. It should start with http:// or https://.'**
  String get invalidLink;

  /// No description provided for @link.
  ///
  /// In en, this message translates to:
  /// **'link'**
  String get link;

  /// No description provided for @linkLimitMessage.
  ///
  /// In en, this message translates to:
  /// **'You have already sent the maximum number of links today. Please try again tomorrow.'**
  String get linkLimitMessage;

  /// No description provided for @linkThankMessage.
  ///
  /// In en, this message translates to:
  /// **'Thank you for the discount link! We really appreciate your help and attention. It\'s really helpful!'**
  String get linkThankMessage;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @shareFailure.
  ///
  /// In en, this message translates to:
  /// **'Unfortunately, we were unable to share this information. There may be a problem with your network connection or the server is temporarily unavailable.'**
  String get shareFailure;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @whatIsWrong.
  ///
  /// In en, this message translates to:
  /// **'What\'s wrong?'**
  String get whatIsWrong;

  /// No description provided for @mobFeedbackHint.
  ///
  /// In en, this message translates to:
  /// **'Let us know about any issues in the app:\nTap \'Navigation\' to use the menu and navigate to other pages in the app. Tap \'Drawing\' to draw on the screen. Tap \'Write a message\' to provide a detailed description of the issue.'**
  String get mobFeedbackHint;

  /// No description provided for @mobOfflineHint.
  ///
  /// In en, this message translates to:
  /// **'Offline mode for mobile devices allows you to use the app without an internet connection.'**
  String get mobOfflineHint;

  /// The button is used to switch to the feedback mode for mobile apps.
  ///
  /// In en, this message translates to:
  /// **'Report bugs'**
  String get reportBugs;

  /// No description provided for @allUkraine.
  ///
  /// In en, this message translates to:
  /// **'All Ukraine'**
  String get allUkraine;

  /// No description provided for @moreCities.
  ///
  /// In en, this message translates to:
  /// **'{count} more..'**
  String moreCities(int count);

  /// No description provided for @privacyPolicyStart.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy for Veteranam.info'**
  String get privacyPolicyStart;

  /// No description provided for @termsConditionsStart.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions for Adding Discounts to the Site'**
  String get termsConditionsStart;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// The button is used to go to the page with frequent questions.
  ///
  /// In en, this message translates to:
  /// **'Frequently asked questions'**
  String get faq;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @copyEmail.
  ///
  /// In en, this message translates to:
  /// **'Email copied'**
  String get copyEmail;

  /// No description provided for @copyPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number cipied'**
  String get copyPhoneNumber;

  /// No description provided for @copyLink.
  ///
  /// In en, this message translates to:
  /// **'Link copied'**
  String get copyLink;

  /// No description provided for @thanks.
  ///
  /// In en, this message translates to:
  /// **'Thank You!!'**
  String get thanks;

  /// No description provided for @toTheMainPage.
  ///
  /// In en, this message translates to:
  /// **'To the main'**
  String get toTheMainPage;

  /// No description provided for @feedbackSent.
  ///
  /// In en, this message translates to:
  /// **'We have received your message and will respond to you as soon as possible.'**
  String get feedbackSent;

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offline;

  /// No description provided for @writeMore.
  ///
  /// In en, this message translates to:
  /// **'Write more'**
  String get writeMore;

  /// No description provided for @aboutNewDiscounts.
  ///
  /// In en, this message translates to:
  /// **'Do you want to be the first to know about new discounts?'**
  String get aboutNewDiscounts;

  /// No description provided for @appUpdateAvailable.
  ///
  /// In en, this message translates to:
  /// **'App Update Available!'**
  String get appUpdateAvailable;

  /// No description provided for @appUpdateAvailableDescription.
  ///
  /// In en, this message translates to:
  /// **'A new version of the app is available for download. Please update the app to improve its performance and access new features.'**
  String get appUpdateAvailableDescription;

  /// The button is used to postpone the app update for one session.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get later;

  /// The button is used to update exist discount.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// The button is used to direct the user to the app where they can update it.
  ///
  /// In en, this message translates to:
  /// **'Update Now'**
  String get updateNow;

  /// No description provided for @aboutNewDiscountsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Write us your email. We promise not to send spam!'**
  String get aboutNewDiscountsSubtitle;

  /// No description provided for @dontRememberPassword.
  ///
  /// In en, this message translates to:
  /// **'Don\'t remember the password'**
  String get dontRememberPassword;

  /// No description provided for @contain15Charcters.
  ///
  /// In en, this message translates to:
  /// **'It must contain at least 15 characters.'**
  String get contain15Charcters;

  /// No description provided for @loginWithoutPassword.
  ///
  /// In en, this message translates to:
  /// **'Login without password'**
  String get loginWithoutPassword;

  /// No description provided for @noInternet.
  ///
  /// In en, this message translates to:
  /// **'No internet'**
  String get noInternet;

  /// No description provided for @loggingInWait.
  ///
  /// In en, this message translates to:
  /// **'Logging in, please wait...'**
  String get loggingInWait;

  /// No description provided for @signingUpWait.
  ///
  /// In en, this message translates to:
  /// **'Signing up, please wait...'**
  String get signingUpWait;

  /// No description provided for @cardNotFoundCardLink.
  ///
  /// In en, this message translates to:
  /// **'Unfortunately, the link was not found. Please check the accuracy of the input or try another link.'**
  String get cardNotFoundCardLink;

  /// No description provided for @discountEditNotFound.
  ///
  /// In en, this message translates to:
  /// **'Unfortunately, the link is incorrect or you do not have the required permissions to access this discount. Please verify the link or try another one.'**
  String get discountEditNotFound;

  /// No description provided for @discountNotFound.
  ///
  /// In en, this message translates to:
  /// **'Unfortunately, the link is incorrect. Please verify the link or try another one.'**
  String get discountNotFound;

  /// No description provided for @signUpInWith.
  ///
  /// In en, this message translates to:
  /// **'Sign up with'**
  String get signUpInWith;

  /// No description provided for @userRole.
  ///
  /// In en, this message translates to:
  /// **'Manage discounts in your business account \"Veteranam\"'**
  String get userRole;

  /// No description provided for @userRoleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Register as a business user and add and edit new offers on your own'**
  String get userRoleSubtitle;

  /// The button is used to go to the business SignUp page
  ///
  /// In en, this message translates to:
  /// **'Registration as a BUSINESS'**
  String get signUpBusiness;

  /// The button is used to go to the user SignUp page
  ///
  /// In en, this message translates to:
  /// **'Registration as a USER'**
  String get signUpUser;

  /// User login button on the UserRole page
  ///
  /// In en, this message translates to:
  /// **'as a PRIVATE person'**
  String get asUser;

  /// No description provided for @main.
  ///
  /// In en, this message translates to:
  /// **'Main'**
  String get main;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// The switch is used to make the discount indefinite or not
  ///
  /// In en, this message translates to:
  /// **'Indefinitely'**
  String get indefinitely;

  /// The field where the validity period of the discount is entered
  ///
  /// In en, this message translates to:
  /// **'Validity period'**
  String get period;

  /// This field is for entering the title of the discount
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @titleExample.
  ///
  /// In en, this message translates to:
  /// **'E.g.: Rehabilitation Massage'**
  String get titleExample;

  /// No description provided for @discountDescription.
  ///
  /// In en, this message translates to:
  /// **'You can add multiple discounts. After entering each discount, press Enter to confirm.'**
  String get discountDescription;

  /// No description provided for @discountLinkDescription.
  ///
  /// In en, this message translates to:
  /// **'Insert a link to the page where you can learn more about the discount. We will contact you if you have any questions.'**
  String get discountLinkDescription;

  /// This field is for entering what the user needs to do to receive the discount
  ///
  /// In en, this message translates to:
  /// **'To receive, you need'**
  String get getYouNeed;

  /// No description provided for @getYouNeedDescription.
  ///
  /// In en, this message translates to:
  /// **'Describe the requirements for receiving the service'**
  String get getYouNeedDescription;

  /// No description provided for @discountsWrongFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid discount format: only percentages or the word \'Free\' are allowed.'**
  String get discountsWrongFormat;

  /// The button is used to return to the previous steps of the form.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// The field is used to enter the categories of people who are eligible for discounts (can be multiple)
  ///
  /// In en, this message translates to:
  /// **'Who is eligible'**
  String get eligibility;

  /// No description provided for @eligibilityDescription.
  ///
  /// In en, this message translates to:
  /// **'Select one or more options from the list'**
  String get eligibilityDescription;

  /// No description provided for @combatantsEligibility.
  ///
  /// In en, this message translates to:
  /// **'Combatants'**
  String get combatantsEligibility;

  /// No description provided for @militaryEligibility.
  ///
  /// In en, this message translates to:
  /// **'Military Personnel'**
  String get militaryEligibility;

  /// No description provided for @fallenFamilyEligibility.
  ///
  /// In en, this message translates to:
  /// **'Family Members of the Deceased'**
  String get fallenFamilyEligibility;

  /// No description provided for @disabledWarEligibility.
  ///
  /// In en, this message translates to:
  /// **'Persons with Disabilities Due to War'**
  String get disabledWarEligibility;

  /// No description provided for @dsnsEligibility.
  ///
  /// In en, this message translates to:
  /// **'Emergency Service Employees'**
  String get dsnsEligibility;

  /// No description provided for @policeEligibility.
  ///
  /// In en, this message translates to:
  /// **'Police'**
  String get policeEligibility;

  /// No description provided for @idpEligibility.
  ///
  /// In en, this message translates to:
  /// **'Internally Displaced Persons'**
  String get idpEligibility;

  /// No description provided for @allOfListed.
  ///
  /// In en, this message translates to:
  /// **'All of the listed'**
  String get allOfListed;

  /// Business login button on the UserRole page
  ///
  /// In en, this message translates to:
  /// **'as a BUSINESS user'**
  String get asBusiness;

  /// No description provided for @myProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get myProfileTitle;

  /// The button is used to save user changes
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChangesProfile;

  /// No description provided for @dataEditing.
  ///
  /// In en, this message translates to:
  /// **'Data Editing'**
  String get dataEditing;

  /// No description provided for @dataIsUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your data has been successfully updated!'**
  String get dataIsUpdatedSuccess;

  /// No description provided for @changesSendInProgress.
  ///
  /// In en, this message translates to:
  /// **'Changes are being saved, please wait...'**
  String get changesSendInProgress;

  /// No description provided for @passwordReset.
  ///
  /// In en, this message translates to:
  /// **'Password Reset'**
  String get passwordReset;

  /// No description provided for @passwordResetDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter the email address you registered with, and we will send a code to reset your password.'**
  String get passwordResetDescription;

  /// No description provided for @passwordResetCodeSending.
  ///
  /// In en, this message translates to:
  /// **'We are sending you an email to reset your password. This might take a few seconds.'**
  String get passwordResetCodeSending;

  /// No description provided for @passwordResetCodeSendFirst.
  ///
  /// In en, this message translates to:
  /// **'We’ve sent the information to'**
  String get passwordResetCodeSendFirst;

  /// No description provided for @passwordResetCodeSendSecond.
  ///
  /// In en, this message translates to:
  /// **'\nFollow the instructions in the email.'**
  String get passwordResetCodeSendSecond;

  /// No description provided for @passwordResetCodeSendThirty.
  ///
  /// In en, this message translates to:
  /// **'\nCheck your Spam and Promotions folders.'**
  String get passwordResetCodeSendThirty;

  /// In this field, the user needs to re-enter their password
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @successfully.
  ///
  /// In en, this message translates to:
  /// **'Successfully!'**
  String get successfully;

  /// No description provided for @successfullyDescruption.
  ///
  /// In en, this message translates to:
  /// **'You have successfully confirmed your access. Now, create a new password.'**
  String get successfullyDescruption;

  /// The button is used to confirm the password change.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @changePasswordWaiting.
  ///
  /// In en, this message translates to:
  /// **'Changing your password. Please wait a moment.'**
  String get changePasswordWaiting;

  /// No description provided for @changedPassword.
  ///
  /// In en, this message translates to:
  /// **'Your password has been changed! You can now log in.'**
  String get changedPassword;

  /// No description provided for @passwordMismatch.
  ///
  /// In en, this message translates to:
  /// **'The passwords do not match. Please make sure both passwords are the same.'**
  String get passwordMismatch;

  /// No description provided for @passwordResetWaiting.
  ///
  /// In en, this message translates to:
  /// **'Please wait, we are verifying your information.'**
  String get passwordResetWaiting;

  /// No description provided for @passwordResetWrongDescriptionFirst.
  ///
  /// In en, this message translates to:
  /// **'The link has expired or is invalid.\n Please try '**
  String get passwordResetWrongDescriptionFirst;

  /// No description provided for @passwordResetWrongDescriptionSecond.
  ///
  /// In en, this message translates to:
  /// **'to send the link again.'**
  String get passwordResetWrongDescriptionSecond;

  /// The button is used to navigate to the Password Reset Email page.
  ///
  /// In en, this message translates to:
  /// **'Send Again'**
  String get sendAgain;

  /// No description provided for @notReceiveLetter.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the email?'**
  String get notReceiveLetter;

  /// No description provided for @resendWait.
  ///
  /// In en, this message translates to:
  /// **'You can resend the email in {remainingSeconds} seconds.'**
  String resendWait(int remainingSeconds);

  /// No description provided for @dataUnmodified.
  ///
  /// In en, this message translates to:
  /// **'No changes were made because the data is identical.'**
  String get dataUnmodified;

  /// No description provided for @publishDiscount.
  ///
  /// In en, this message translates to:
  /// **'Publish your first discount'**
  String get publishDiscount;

  /// The button is used to add a discount
  ///
  /// In en, this message translates to:
  /// **'Add discount'**
  String get addDiscount;

  /// No description provided for @thatEndOfMyDiscounts.
  ///
  /// In en, this message translates to:
  /// **'This is the end of the list! We hope you found what you were looking for.'**
  String get thatEndOfMyDiscounts;

  /// No description provided for @profileNotFilledOut.
  ///
  /// In en, this message translates to:
  /// **'To add a discount, please fill in the company information in your personal account'**
  String get profileNotFilledOut;

  /// No description provided for @underReview.
  ///
  /// In en, this message translates to:
  /// **'Under Review'**
  String get underReview;

  /// No description provided for @overdue.
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get overdue;

  /// No description provided for @rejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get rejected;

  /// No description provided for @published.
  ///
  /// In en, this message translates to:
  /// **'Published'**
  String get published;

  /// No description provided for @deactivated.
  ///
  /// In en, this message translates to:
  /// **'Deactivated'**
  String get deactivated;

  /// The button is used to go to the cabinet
  ///
  /// In en, this message translates to:
  /// **'To profile'**
  String get toProfile;

  /// No description provided for @categoryDescription.
  ///
  /// In en, this message translates to:
  /// **'Select one or more categories. If the desired category is not in the list, please write it in.'**
  String get categoryDescription;

  /// This field is used for entering the company name for business accounts.
  ///
  /// In en, this message translates to:
  /// **'Company Name'**
  String get companyName;

  /// This field is used for entering the company code for business accounts.
  ///
  /// In en, this message translates to:
  /// **'EDRPOU/RNOKPP code'**
  String get companyCode;

  /// This field is used for entering the website link for business accounts.
  ///
  /// In en, this message translates to:
  /// **'Website link'**
  String get linkOnWebsite;

  /// No description provided for @myCompany.
  ///
  /// In en, this message translates to:
  /// **'My company'**
  String get myCompany;

  /// No description provided for @descriptionForRejectedStatus.
  ///
  /// In en, this message translates to:
  /// **'Your ad could not be published due to some errors.\nPlease contact our email: hello@veteranam.info for details'**
  String get descriptionForRejectedStatus;

  /// The button is used to log out of the account.
  ///
  /// In en, this message translates to:
  /// **'Log out?'**
  String get logOutFromProfile;

  /// The button is used to delete an account.
  ///
  /// In en, this message translates to:
  /// **'Delete profile?'**
  String get deleteProfile;

  /// The button is used to delete an account.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// The button is used to return to the previous page.
  ///
  /// In en, this message translates to:
  /// **'Cancel changes?'**
  String get cancelChanges;

  /// No description provided for @cancelChangesQuestion.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel the changes? All new data will be deleted'**
  String get cancelChangesQuestion;

  /// The button is used to stay on the page.
  ///
  /// In en, this message translates to:
  /// **'Continue Working'**
  String get continueWorking;

  /// No description provided for @deleteDiscount.
  ///
  /// In en, this message translates to:
  /// **'Delete discount?'**
  String get deleteDiscount;

  /// No description provided for @linkDiscountAdd.
  ///
  /// In en, this message translates to:
  /// **'Direct discount link'**
  String get linkDiscountAdd;

  /// No description provided for @discountLimitMessage.
  ///
  /// In en, this message translates to:
  /// **'The maximum number for one discount is'**
  String get discountLimitMessage;

  /// No description provided for @citiesLimit.
  ///
  /// In en, this message translates to:
  /// **'cities 30.'**
  String get citiesLimit;

  /// No description provided for @categoriesLimit.
  ///
  /// In en, this message translates to:
  /// **'categories 2.'**
  String get categoriesLimit;

  /// No description provided for @discountWrongRange.
  ///
  /// In en, this message translates to:
  /// **'The discount must be no more than 100% and no less than 1%'**
  String get discountWrongRange;

  /// No description provided for @deleteDiscountQuestion.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this discount? All data will be lost'**
  String get deleteDiscountQuestion;

  /// No description provided for @logOutProfileQuestion.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out of your profile?'**
  String get logOutProfileQuestion;

  /// The switch is used to add an 'online' tag to the discount, indicating that it can be used online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get online;

  /// No description provided for @verification.
  ///
  /// In en, this message translates to:
  /// **'for verification?'**
  String get verification;

  /// No description provided for @publishVerificationSubtitleFirst.
  ///
  /// In en, this message translates to:
  /// **'Once you click the'**
  String get publishVerificationSubtitleFirst;

  /// No description provided for @publishVerificationSubtitleSecond.
  ///
  /// In en, this message translates to:
  /// **'we will begin processing your discount request. If the discount is successfully approved, you will receive an email notification, and the discount will appear on the site. If the discount is rejected, please contact our team at'**
  String get publishVerificationSubtitleSecond;

  /// No description provided for @publishVerificationSubtitleThird.
  ///
  /// In en, this message translates to:
  /// **'for assistance.'**
  String get publishVerificationSubtitleThird;

  /// No description provided for @iAgreeWith.
  ///
  /// In en, this message translates to:
  /// **'I agree to the'**
  String get iAgreeWith;

  /// No description provided for @iAgree.
  ///
  /// In en, this message translates to:
  /// **'I agree'**
  String get iAgree;

  /// The field is used to input the company's brand name.
  ///
  /// In en, this message translates to:
  /// **'Brand Name'**
  String get brandName;

  /// The field is used to input the company's brand name.
  ///
  /// In en, this message translates to:
  /// **'This name will be indicated in the discount announcement'**
  String get brandNameDescription;

  /// The field is used to input the company name for business accounts.
  ///
  /// In en, this message translates to:
  /// **'For example, \"Ivanov and Partners LLC\"'**
  String get companyNameDescription;

  /// The field is used to input the company code for business accounts.
  ///
  /// In en, this message translates to:
  /// **'Must contain 8-10 digits'**
  String get companyCodeDescription;

  /// No description provided for @deleteCompanyMessage.
  ///
  /// In en, this message translates to:
  /// **'Deleting a company account is only possible after deleting all published discounts. Please first delete all discounts associated with your account if you want to deactivate it.'**
  String get deleteCompanyMessage;

  /// No description provided for @deleteCompanyLoadingMessage.
  ///
  /// In en, this message translates to:
  /// **'Company data is loading, please be patient.'**
  String get deleteCompanyLoadingMessage;

  /// No description provided for @deleteCompanyEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Before deleting the company account, it needs to be created first.'**
  String get deleteCompanyEmptyMessage;

  /// The button is used to create a business account.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get createAccount;

  /// The button is used to navigate to the Terms and Conditions page.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get termsAndConditions;

  /// No description provided for @changesNotSaved.
  ///
  /// In en, this message translates to:
  /// **'Changes\n are not saved'**
  String get changesNotSaved;

  /// No description provided for @deleteProfileQuestion.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your profile? All data will be lost, but you can restore your profile if you log in within the next 30 days.'**
  String get deleteProfileQuestion;

  /// No description provided for @enableButton.
  ///
  /// In en, this message translates to:
  /// **'Button will be active after'**
  String get enableButton;

  /// No description provided for @onlyEnglishLetter.
  ///
  /// In en, this message translates to:
  /// **'must contain only English letters or symbols'**
  String get onlyEnglishLetter;

  /// No description provided for @seconds.
  ///
  /// In en, this message translates to:
  /// **'seconds'**
  String get seconds;

  /// No description provided for @invalidLinkTitle.
  ///
  /// In en, this message translates to:
  /// **'Invalid link'**
  String get invalidLinkTitle;

  /// No description provided for @dataSendInProgress.
  ///
  /// In en, this message translates to:
  /// **'Data are being saved, please wait...'**
  String get dataSendInProgress;

  /// No description provided for @dataIsSavedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your data has been successfully saved!'**
  String get dataIsSavedSuccess;

  /// No description provided for @joinUs.
  ///
  /// In en, this message translates to:
  /// **'Join Us'**
  String get joinUs;

  /// The button is used to sort discounts by date. From newest to oldest.
  ///
  /// In en, this message translates to:
  /// **'By newest'**
  String get sortByDate;

  /// Error message displayed during filtering
  ///
  /// In en, this message translates to:
  /// **'An error occurred during filtering.'**
  String get discountFilterFailureMessage;

  /// The button is used to activate a discount created by the user.
  ///
  /// In en, this message translates to:
  /// **'Activate'**
  String get activate;

  /// No description provided for @moreWhomGranted.
  ///
  /// In en, this message translates to:
  /// **'{count} more..'**
  String moreWhomGranted(int count);

  /// Button use for show phone number.
  ///
  /// In en, this message translates to:
  /// **'Show phone number'**
  String get showPhoneNumber;

  /// No description provided for @moreDetails.
  ///
  /// In en, this message translates to:
  /// **'More Details'**
  String get moreDetails;

  /// No description provided for @applySelectedFilter.
  ///
  /// In en, this message translates to:
  /// **'Apply the selected filter?'**
  String get applySelectedFilter;

  /// No description provided for @applySelectedFilterSubtitle.
  ///
  /// In en, this message translates to:
  /// **'You have selected filters but haven\'t applied them. Would you like to apply them?'**
  String get applySelectedFilterSubtitle;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'to'**
  String get to;

  /// The button is used to sort discounts by date. From newest to oldest. The first discounts will be those added by the business.
  ///
  /// In en, this message translates to:
  /// **'Featured'**
  String get featured;

  /// No description provided for @websiteLinkDescription.
  ///
  /// In en, this message translates to:
  /// **'We are taking your to a 3rd party website. Please use information on this resource at your own risk.'**
  String get websiteLinkDescription;

  /// No description provided for @websiteLinkTitle.
  ///
  /// In en, this message translates to:
  /// **'Attention! Redirecting to a third-party website'**
  String get websiteLinkTitle;

  /// No description provided for @reportWithoutEmailDescriptionPart1.
  ///
  /// In en, this message translates to:
  /// **'We might need your email address to contact you. If you'**
  String get reportWithoutEmailDescriptionPart1;

  /// No description provided for @reportWithoutEmailDescriptionPart2.
  ///
  /// In en, this message translates to:
  /// **'sign up'**
  String get reportWithoutEmailDescriptionPart2;

  /// No description provided for @reportWithoutEmailDescriptionPart3.
  ///
  /// In en, this message translates to:
  /// **'we will be able to contact you via the email address on your account.'**
  String get reportWithoutEmailDescriptionPart3;

  /// The button is used to like the card data.
  ///
  /// In en, this message translates to:
  /// **'Like'**
  String get favorite;

  /// No description provided for @unauthorizedFailure.
  ///
  /// In en, this message translates to:
  /// **'You are not authorized. Please check your login credentials.'**
  String get unauthorizedFailure;

  /// No description provided for @userNotFoundFailure.
  ///
  /// In en, this message translates to:
  /// **'User not found. Please verify your entered data.'**
  String get userNotFoundFailure;

  /// No description provided for @userDuplicateFailure.
  ///
  /// In en, this message translates to:
  /// **'This user already exists. Please try using a different email address.'**
  String get userDuplicateFailure;

  /// No description provided for @requiresRecentLoginFailure.
  ///
  /// In en, this message translates to:
  /// **'Requirement: You need to re-login to proceed.'**
  String get requiresRecentLoginFailure;

  /// No description provided for @userEmailDuplicateFailure.
  ///
  /// In en, this message translates to:
  /// **'This email is already registered. Please try a different one.'**
  String get userEmailDuplicateFailure;

  /// No description provided for @tooManyRequestsFailure.
  ///
  /// In en, this message translates to:
  /// **'Too many requests. Please try again later.'**
  String get tooManyRequestsFailure;

  /// No description provided for @permissionFailure.
  ///
  /// In en, this message translates to:
  /// **'You do not have permission to perform this action.'**
  String get permissionFailure;

  /// No description provided for @emailSendingFailedFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to send email. Please try again.'**
  String get emailSendingFailedFailure;

  /// No description provided for @linkFailure.
  ///
  /// In en, this message translates to:
  /// **'Error with the link. Please check the URL and try again.'**
  String get linkFailure;

  /// No description provided for @copyFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to copy data.'**
  String get copyFailure;

  /// No description provided for @wrongVerifyCodeFailure.
  ///
  /// In en, this message translates to:
  /// **'Invalid verification code.'**
  String get wrongVerifyCodeFailure;

  /// No description provided for @invalidInputFailure.
  ///
  /// In en, this message translates to:
  /// **'Invalid input. Please check the entered data.'**
  String get invalidInputFailure;

  /// No description provided for @browserNotSupportPopupDialogFailure.
  ///
  /// In en, this message translates to:
  /// **'Your browser does not support pop-up windows.'**
  String get browserNotSupportPopupDialogFailure;

  /// No description provided for @emailInvalidFormatFailure.
  ///
  /// In en, this message translates to:
  /// **'Invalid email format. Please check the entered email.'**
  String get emailInvalidFormatFailure;

  /// No description provided for @passwordWrongFailure.
  ///
  /// In en, this message translates to:
  /// **'Incorrect password.'**
  String get passwordWrongFailure;

  /// No description provided for @passwordWeakFailure.
  ///
  /// In en, this message translates to:
  /// **'Password is too weak. Please try using a stronger one.'**
  String get passwordWeakFailure;

  /// No description provided for @userDisableFailure.
  ///
  /// In en, this message translates to:
  /// **'Your account has been disabled. Please contact support.'**
  String get userDisableFailure;

  /// No description provided for @dataNotFoundFailure.
  ///
  /// In en, this message translates to:
  /// **'Data not found. Please try again later.'**
  String get dataNotFoundFailure;

  /// No description provided for @wrongIDFailure.
  ///
  /// In en, this message translates to:
  /// **'Invalid ID. Please check the entered data.'**
  String get wrongIDFailure;

  /// No description provided for @linkWrongFailure.
  ///
  /// In en, this message translates to:
  /// **'Incorrect link. Please check it and try again.'**
  String get linkWrongFailure;

  /// No description provided for @timeoutFailure.
  ///
  /// In en, this message translates to:
  /// **'The request timed out. Please try again.'**
  String get timeoutFailure;

  /// No description provided for @unkownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown error.'**
  String get unkownError;

  /// No description provided for @serverErrorFailure.
  ///
  /// In en, this message translates to:
  /// **'Unknown error.'**
  String get serverErrorFailure;

  /// No description provided for @noSuchMethodErrorFailure.
  ///
  /// In en, this message translates to:
  /// **'Unknown error.'**
  String get noSuchMethodErrorFailure;

  /// No description provided for @typeFailure.
  ///
  /// In en, this message translates to:
  /// **'Data type mismatch. Please check the entered values.'**
  String get typeFailure;

  /// No description provided for @assertionFailure.
  ///
  /// In en, this message translates to:
  /// **'An error occurred during validation. Please try again.'**
  String get assertionFailure;

  /// No description provided for @unimplementedFeatureFailure.
  ///
  /// In en, this message translates to:
  /// **'This feature has not been implemented yet.'**
  String get unimplementedFeatureFailure;

  /// No description provided for @formatFailure.
  ///
  /// In en, this message translates to:
  /// **'Invalid data format. Please check the entered values.'**
  String get formatFailure;

  /// No description provided for @maxRetriesFailure.
  ///
  /// In en, this message translates to:
  /// **'Maximum retry attempts reached. Please try again later.'**
  String get maxRetriesFailure;

  /// No description provided for @loadFileCancelFailure.
  ///
  /// In en, this message translates to:
  /// **'File download cancelled.'**
  String get loadFileCancelFailure;

  /// No description provided for @cancelledFailure.
  ///
  /// In en, this message translates to:
  /// **'Operation has been cancelled.'**
  String get cancelledFailure;

  /// No description provided for @fcmFailure.
  ///
  /// In en, this message translates to:
  /// **'Error while loading data. Please reload the page or contact us if the issue persists.'**
  String get fcmFailure;

  /// No description provided for @unsupportedError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while performing your action. Please try again or contact support if the issue persists.'**
  String get unsupportedError;

  /// Text Field for enter company email. Show only for admin account
  ///
  /// In en, this message translates to:
  /// **'Company email'**
  String get companyEmail;

  /// No description provided for @showOnlyForAdminAccount.
  ///
  /// In en, this message translates to:
  /// **'Show only for admin account'**
  String get showOnlyForAdminAccount;

  /// The button is used to accept all cookies and analytics.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// The button is used to accept only necessary cookies and analytics.
  ///
  /// In en, this message translates to:
  /// **'Accept necessary'**
  String get acceptNecessary;

  /// No description provided for @copyNotSupportError.
  ///
  /// In en, this message translates to:
  /// **'It seems copying is not supported on your device, or an error occurred.'**
  String get copyNotSupportError;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// Greeting message displayed in the Mob Authentication Dialog when the user is logging in.
  ///
  /// In en, this message translates to:
  /// **'Nice to see you again in the Veteranam app.😊'**
  String get loginGreeting;

  /// Success message displayed in the Mob Authentication Dialog after successful sign up.
  ///
  /// In en, this message translates to:
  /// **'You have successfully registered in the Veteranam app.🎉'**
  String get signUpSuccess;

  /// No description provided for @cookies.
  ///
  /// In en, this message translates to:
  /// **'The \"veteranam\" service uses essential cookies for security and stability, as well as anonymous analytical cookies to improve the service and personalized ads from Google Ads. By continuing to use it, you agree to the use of all types of cookies and our '**
  String get cookies;
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
      <String>['en', 'uk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'uk':
      return AppLocalizationsUk();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
