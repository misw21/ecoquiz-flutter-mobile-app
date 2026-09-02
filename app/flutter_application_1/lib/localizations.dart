import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'loginScreen': 'Login',
      'email': 'Email',
      'enterEmail': 'Enter your email',
      'password': 'Password',
      'enterPassword': 'Enter your password',
      'username': 'Username',
      'enterUsername': 'Enter your username',
      'validate': 'This field is required',
      'login': 'Login',
      'settings': 'Settings',
      'darkMode': 'Dark Mode',
      'language': 'Language',
      'english': 'English',
      'arabic': 'Arabic',
      'quizApp': 'Quiz App',
      'menu': 'Menu',
      'question': 'Question',
      'score': 'Score',
      'correctAnswer': 'Correct Answer',
      'quizCompleted': 'Quiz Completed',
      'yourScore': 'Your Score',
      'restartQuiz': 'Restart Quiz',
      'emailValidation': 'Please enter a valid email address',
      'passwordValidation': 'Password must be at least 6 characters',
      'usernameValidation': 'Username must be at least 3 characters',
    },
    'ar': {
      'loginScreen': 'تسجيل الدخول',
      'email': 'البريد الإلكتروني',
      'enterEmail': 'أدخل بريدك الإلكتروني',
      'password': 'كلمة المرور',
      'enterPassword': 'أدخل كلمة المرور',
      'username': 'اسم المستخدم',
      'enterUsername': 'أدخل اسم المستخدم',
      'validate': 'هذا الحقل مطلوب',
      'login': 'تسجيل الدخول',
      'settings': 'الإعدادات',
      'darkMode': 'الوضع الداكن',
      'language': 'اللغة',
      'english': 'الإنجليزية',
      'arabic': 'العربية',
      'quizApp': 'تطبيق الاختبار',
      'menu': 'القائمة',
      'question': 'سؤال',
      'score': 'النتيجة',
      'correctAnswer': 'الإجابة الصحيحة',
      'quizCompleted': 'اكتمل الاختبار',
      'yourScore': 'نتيجتك',
      'restartQuiz': 'إعادة الاختبار',
      'emailValidation': 'الرجاء إدخال عنوان بريد إلكتروني صحيح',
      'passwordValidation': 'يجب أن تكون كلمة المرور على الأقل 6 أحرف',
      'usernameValidation': 'يجب أن يكون اسم المستخدم على الأقل 3 أحرف',
    },
  };

  String get loginScreen =>
      _localizedValues[locale.languageCode]!['loginScreen']!;
  String get email => _localizedValues[locale.languageCode]!['email']!;
  String get enterEmail =>
      _localizedValues[locale.languageCode]!['enterEmail']!;
  String get password => _localizedValues[locale.languageCode]!['password']!;
  String get enterPassword =>
      _localizedValues[locale.languageCode]!['enterPassword']!;
  String get username => _localizedValues[locale.languageCode]!['username']!;
  String get enterUsername =>
      _localizedValues[locale.languageCode]!['enterUsername']!;
  String get validate => _localizedValues[locale.languageCode]!['validate']!;
  String get login => _localizedValues[locale.languageCode]!['login']!;
  String get settings => _localizedValues[locale.languageCode]!['settings']!;
  String get darkMode => _localizedValues[locale.languageCode]!['darkMode']!;
  String get language => _localizedValues[locale.languageCode]!['language']!;
  String get english => _localizedValues[locale.languageCode]!['english']!;
  String get arabic => _localizedValues[locale.languageCode]!['arabic']!;
  String get quizApp => _localizedValues[locale.languageCode]!['quizApp']!;
  String get menu => _localizedValues[locale.languageCode]!['menu']!;
  String get question => _localizedValues[locale.languageCode]!['question']!;
  String get score => _localizedValues[locale.languageCode]!['score']!;
  String get correctAnswer =>
      _localizedValues[locale.languageCode]!['correctAnswer']!;
  String get quizCompleted =>
      _localizedValues[locale.languageCode]!['quizCompleted']!;
  String get yourScore => _localizedValues[locale.languageCode]!['yourScore']!;
  String get restartQuiz =>
      _localizedValues[locale.languageCode]!['restartQuiz']!;
  String get emailValidation =>
      _localizedValues[locale.languageCode]!['emailValidation']!;
  String get passwordValidation =>
      _localizedValues[locale.languageCode]!['passwordValidation']!;
  String get usernameValidation =>
      _localizedValues[locale.languageCode]!['usernameValidation']!;
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) {
    return false;
  }
}
