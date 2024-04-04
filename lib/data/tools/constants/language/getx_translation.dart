import 'package:get/get.dart';

import 'lang_uz.dart';
import 'lang_en.dart';
import 'lang_ru.dart';

// class LocalizationGetXController extends GetxController{
//   void changeLanguage(String lang){
//     var locale = Locale(lang);
//     Get.log("Ishladi changeLanguage");
//     Get.updateLocale(locale);
//   }
// }


class LocalizationsGetX extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "uz_Uz": langUz,
    "en_En": langEn,
    "ru_Ru": langRu,
  };
}

class AppLocalization {
  AppLocalization();

  String get splashText1 => "splashText1".tr;
  String get splashText2 => "splashText2".tr;
  String get splashText3 => "splashText3".tr;
  String get next => "next".tr;
  String get start => "start".tr;
  String get login => "login".tr;
  String get continueWithFacebook => "continueWithFacebook".tr;
  String get continueWithGoogle => "continueWithGoogle".tr;
  String get or => "or".tr;
  String get enterWithPassword => "enterWithPassword".tr;
  String get noAccount => "noAccount".tr;
  String get yesAccount => "yesAccount".tr;
  String get register => "register".tr;
  String get createAccount => "createAccount".tr;
  String get email => "email".tr;
  String get password => "password".tr;
  String get confirmPassword => "confirmPassword".tr;
  String get remember => "remember".tr;
  String get continueWord => "continue".tr;
  String get enter => "enter".tr;
  String get forgotPassword => "forgotPassword".tr;
  String get chooseResetPasswordOption => "chooseResetPasswordOption".tr;
  String get enterPhone => "enterPhone".tr;
  String get enterGmail => "enterGmail".tr;
  String get code => "code".tr;
  String get sentToNumber => "sentToNumber".tr;
  String get resendCode => "resendCode".tr;
  String get confirm => "confirm".tr;
  String get createNewPassword => "createNewPassword".tr;
  String get createYourNewPassword => "createYourNewPassword".tr;
  String get congratulations => "congratulations".tr;
  String get successDialogDescription => "successDialogDescription".tr;
  String get goodMorning => "goodMorning".tr;
  String get goodAfternoon => "goodAfternoon".tr;
  String get goodEvening => "goodEvening".tr;
  String get all => "all".tr;
  String get offers => "offers".tr;
  String get services => "services".tr;
  String get cleaning => "cleaning".tr;
  String get repair => "repair".tr;
  String get paint => "paint".tr;
  String get laundry => "laundry".tr;
  String get furniture => "furniture".tr;
  String get plumbing => "plumbing".tr;
  String get delivery => "delivery".tr;
  String get beauty => "beauty".tr;
  String get acRepair => "acRepair".tr;
  String get transport => "transport".tr;
  String get electronics => "electronics".tr;
  String get massage => "massage".tr;
  String get menSalon => "menSalon".tr;
  String get more => "more".tr;
  String get comments => "comments".tr;
  String get main => "main".tr;
  String get orders => "orders".tr;
  String get chats => "chats".tr;
  String get profile => "profile".tr;
  String get filter => "filter".tr;
  String get category => "category".tr;
  String get price => "price".tr;
  String get rating => "rating".tr;
  String get reset => "reset".tr;
  String get remove => "remove".tr;
  String get cancel => "cancel".tr;
  String get yesRemove => "yesRemove".tr;
  String get notification => "notification".tr;
  String get specialOffers => "specialOffers".tr;
  String get popularServices => "popularServices".tr;
  String get orderService => "orderService".tr;
  String get whatDoYouNeed => "whatDoYouNeed".tr;
  String get mainThingAboutTask => "mainThingAboutTask".tr;
  String get back => "back".tr;
  String get whereIsProblem => "whereIsProblem".tr;
  String get whatHappened => "whatHappened".tr;
  String get workingOnOrder => "workingOnOrder".tr;
  String get weCountStars => "weCountStars".tr;
  String get whenServiceNeed => "whenServiceNeed".tr;
  String get whereWorkLocation => "whereWorkLocation".tr;
  String get recent => "recent".tr;
  String get notFound => "notFound".tr;
  String get found => "found".tr;
  String get searchFail => "searchFail".tr;
  String get results => "results".tr;
  String get search => "search".tr;
  String get allServices => "allServices".tr;
  String get perHour => "perHour".tr;
  String get aboutMe => "aboutMe".tr;
  String get photosFromWork => "photosFromWork".tr;
  String get viewAll => "viewAll".tr;
  String get message => "message".tr;
  String get upcoming => "upcoming".tr;
  String get completed => "completed".tr;
  String get canceled => "canceled".tr;
  String get dateTime => "dateTime".tr;
  String get address => "address".tr;
  String get viewViaGoogle => "viewViaGoogle".tr;
  String get noFutureBooking => "noFutureBooking".tr;
  String get createBooking => "createBooking".tr;
  String get newBooking => "newBooking".tr;
  String get cancelOrder => "cancelOrder".tr;
  String get yesCancelOrder => "yesCancelOrder".tr;
  String get sureCancelOrder => "sureCancelOrder".tr;
  String get refund80 => "refund80".tr;
  String get paymentMethods => "paymentMethods".tr;
  String get choosePaymentMethod => "choosePaymentMethod".tr;
  String get paid => "paid".tr;
  String get refund => "refund".tr;
  String get enterPinCode => "enterPinCode".tr;
  String get enterPinCodeForCancel => "enterPinCodeForCancel".tr;
  String get bookingSuccessfullyCanceled => "bookingSuccessfullyCanceled".tr;
  String get willRefund80 => "willRefund80".tr;
  String get calls => "calls".tr;
  String get incoming => "incoming".tr;
  String get outgoing => "outgoing".tr;
  String get missed => "missed".tr;
  String get chatMessage => "chatMessage".tr;
  String get today => "today".tr;
  String get minutes => "minutes".tr;
  String get editProfile => "editProfile".tr;
  String get payment => "payment".tr;
  String get security => "security".tr;
  String get language => "language".tr;
  String get privacyPolicy => "privacyPolicy".tr;
  String get helpCenter => "helpCenter".tr;
  String get inviteFriends => "inviteFriends".tr;
  String get logout => "logout".tr;
  String get male => "male".tr;
  String get female => "female".tr;
  String get commonNotification => "commonNotification".tr;
  String get sound => "sound".tr;
  String get vibration => "vibration".tr;
  String get promoAndDiscount => "promoAndDiscount".tr;
  String get payments => "payments".tr;
  String get cashback => "cashback".tr;
  String get appUpdates => "appUpdates".tr;
  String get newServiceAvailable => "newServiceAvailable".tr;
  String get thereAreNewTips => "thereAreNewTips".tr;
  String get update => "update".tr;
  String get addNewCard => "addNewCard".tr;
  String get connected => "connected".tr;
  String get cardName => "cardName".tr;
  String get cardNumber => "cardNumber".tr;
  String get validityPeriod => "validityPeriod".tr;
  String get invite => "invite".tr;
  String get invited => "invited".tr;
  String get rememberMe => "rememberMe".tr;
  String get biometricID => "biometricID".tr;
  String get changePinCode => "changePinCode".tr;
  String get changePassword => "changePassword".tr;
  String get general => "general".tr;
  String get account => "account".tr;
  String get service => "service".tr;
  String get contactUs => "contactUs".tr;
  String get customerService => "customerService".tr;
  String get webSite => "webSite".tr;
  String get sureLogout => "sureLogout".tr;
  String get yesLogout => "yesLogout".tr;
}
