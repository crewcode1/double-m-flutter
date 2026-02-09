// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get welcome => 'أهلاً بك';

  @override
  String get welcomeBack => 'مرحباً بعودتك';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get emailOrPhone => 'البريد الإلكتروني / رقم الهاتف';

  @override
  String get password => 'كلمة المرور';

  @override
  String get rememberMe => 'تذكرني';

  @override
  String get forgotPassword => 'هل نسيت كلمة المرور؟';

  @override
  String get alreadyHaveAccount => 'هل لديك حساب بالفعل؟';

  @override
  String get createAccount => 'إنشاء حساب';

  @override
  String get signUp => 'تسجيل حساب جديد';

  @override
  String get firstName => 'الاسم الأول';

  @override
  String get lastName => 'اسم العائلة';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get phone => 'رقم الهاتف';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get verification => 'التحقق';

  @override
  String get accountVerification => 'التحقق من الحساب';

  @override
  String get sixDigitCode => 'ادخل رمز التحقق المكون من 6 أرقام';

  @override
  String get verificationValidationTime =>
      'يرجى ملاحظة أن رمز التحقق صالح لمدة 60 ثانية فقط. إعادة الإرسال؟';

  @override
  String get send => 'إرسال';

  @override
  String get home => 'الرئيسية';

  @override
  String get teachers => 'المعلمون';

  @override
  String get students => 'الطلاب';

  @override
  String get platformTeatchers => 'معلمو المنصة';

  @override
  String get currentCourses => 'الدورات الحالية';

  @override
  String get notifications => 'الإشعارات';

  @override
  String get quizzes => 'الاختبارات';

  @override
  String get done => 'تم';

  @override
  String get sessions => 'الجلسات';

  @override
  String get settings => 'الإعدادات';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get language => 'اللغة';

  @override
  String get theme => 'السِمة';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get deleteAccount => 'حذف الحساب';

  @override
  String get emptyField => 'هذا الحقل لا يمكن أن يكون فارغا';

  @override
  String get invalidEmail => 'بريد إلكتروني غير صحيح';

  @override
  String get invalidPhoneNumber => 'رقم هاتف غير صحيح';

  @override
  String get invalidName => 'إسم غير صحيح';

  @override
  String get enterCode => 'أدخل الكود المكون من ٦ أرقام';

  @override
  String get yes => 'نعم';

  @override
  String get no => 'لا';

  @override
  String get areYouSureYouWantToLogout => 'هل أنت متأكد أنك تريد تسجيل الخروج؟';

  @override
  String get areYouSureYouWantToDeleteYourAccount =>
      'هل أنت متأكد أنك تريد حذف حسابك؟';

  @override
  String get lightTheme => 'النهاري';

  @override
  String get darkTheme => 'الليلي';

  @override
  String get english => 'الإنجليزية';

  @override
  String get arabic => 'العربية';
}
