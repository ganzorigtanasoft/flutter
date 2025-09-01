import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Func {
  static bool isEmpty(Object? o) => o == null || o == '';

  static bool isNotEmpty(Object? o) => o != null && o != '';

  static String toStr(Object? obj) {
    String res = '';
    try {
      if (obj == null) {
        res = '';
      } else if (obj is DateTime) {
        // res = DateFormat('yyyy-MM-dd HH:mm:ss').format(obj);
        res = DateFormat('yyyy-MM-dd').format(obj);
      } else if (obj is int) {
        res = obj.toString();
      } else if (obj is double) {
        res = obj.toString();
      } else if (obj is String) {
        res = obj;
      }
    } catch (e) {
      print(e);
    }
    return res;
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
    SystemChannels.textInput.invokeMethod('TextInput.hide'); // hide keyboard
  }

//   static String toMoneyStr(
//     Object value, {
//     bool obscureText = false, //Secure mode ашиглах эсэх
//     NumberFormat? numberFormat,
//   }) {
//     /// Format number with "Decimal Point" digit grouping.
//     /// 10000 -> 10,000.00
//     if (obscureText) return (LocaleKeys.obscureChar + LocaleKeys.obscureChar + LocaleKeys.obscureChar);

//     //Хоосон утгатай эсэх
//     if (Func.toStr(value) == "") {
//       return "0.00";
//     }

//     //Зөвхөн тоо агуулсан эсэх
//     String tmpStr = Func.toStr(value).replaceAll(",", "").replaceAll(".", "");
//     if (!isNumeric(tmpStr)) {
//       return "0.00";
//     }

//     //Хэрэв ',' тэмдэгт агуулсан бол устгана
//     double tmpDouble = double.parse(Func.toStr(value).replaceAll(",", ""));

//     String result = "";
//     try {
//       //Format number
//       NumberFormat formatter = numberFormat ?? NumberFormat("#,###.##");
//       result = formatter.format(tmpDouble);
//     } catch (e) {
//       print(e);
//       result = "0.00";
//     }

//     return result;
//   }

//   static String toStrFixed(double? value, {int fractionDigits = 2}) {
//     /// Format number with "Decimal Point" digit grouping. 1.567 -> 1.56
//     if (value == null) return '0.00';
//     return value.toStringAsFixed(fractionDigits);
//   }

//   static bool isNumeric(String? str) {
//     if (str == null) {
//       return false;
//     }
//     return double.tryParse(str) != null;
//   }

//   static String toCurSymbol(String curCode) {
//     String currencySymbol;

//     switch (Func.toStr(curCode)) {
//       case "MNT":
//         currencySymbol = "₮";
//         break;

//       case "EUR":
//         currencySymbol = "€";
//         break;

//       case "USD":
//         currencySymbol = "\$";
//         break;

//       default:
//         currencySymbol = "";
//         break;
//     }

//     return currencySymbol;
//   }

//   static String toDateTimeStr(String str) {
//     // Datetime string-ийг форматлаад буцаана '2019.01.01T15:13:00.000' to '2019.01.01 15:13:00'
//     if (isEmpty(str)) return '';

//     DateTime dateTime = DateTime.parse(str);
//     String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);

//     return formattedDate; //trim(str.split(" ")[0]);
//   }

//   static String toTimeStr(String? str) {
//     if (isEmpty(str)) return '';

//     DateTime dateTime = DateTime.parse(str!).toLocal();
//     String formattedDate = DateFormat('HH:mm').format(dateTime);

//     return formattedDate;
//   }

//   static String dateTimeDifference(String date) {
//     // Өнөөдөр болон Datetime string-н хоорондох өдрийн зөрүүг буцаана '2022.01.01' to '2 өдрийн өмнө'
//     String result = '';

//     if (isEmpty(date)) return '';

//     DateTime today = DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));
//     DateTime dateTime = DateTime.parse(DateFormat('yyyy-MM-dd').format(Func.toDate(date)!)); //DateTime.parse(str);

//     final Duration duration = today.difference(dateTime);

//     if (duration.inDays == 0) {
//       result = "Өнөөдөр";
//     } else if (duration.inDays == 1) {
//       result = "Өчигдөр";
//     } else if (duration.inDays > 1) {
//       result = '${duration.inDays} өдрийн өмнө';
//     }
//     return result;
//   }

//   // static String toDateStr(String str) {
//   //   // Datetime string-ийг форматлаад буцаана '2019.01.01T15:13:00.000' to '2019.01.01'
//   //   if (isEmpty(str)) return '';
//   //
//   //   DateTime dateTime = DateTime.parse(str);
//   //   String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
//   //
//   //   return formattedDate; //trim(str.split(" ")[0]);
//   // }

//   static String toDateStr(DateTime? dateTime, {String? dateFormat}) {
//     if (dateTime == null) return '';

//     var res = '';
//     res = DateFormat(dateFormat ?? 'yyyy.MM.dd').format(dateTime);

//     return res;
//   }

//   static String toWeekDay(DateTime? dateTime) {
//     if (dateTime == null) return '';

//     var res = '';
//     res = DateFormat('EEEE', 'mn').format(dateTime);

//     return res;
//   }

//   /// Can return null value
//   static DateTime? toDate(String? str) {
//     try {
//       return Func.isNotEmpty(str) ? DateTime.parse(str!) : null;
//     } catch (e) {
//       print(e);
//     }

//     return null;
//   }

//   static DateTime? toDottedStringToDate(String str) {
//     List<String> dateParts = str.split('.');

//     int year = int.parse(dateParts[0]);
//     int month = int.parse(dateParts[1]);
//     int day = int.parse(dateParts[2]);

//     DateTime dateTime = DateTime(year, month, day);
//     return dateTime;
//   }

//   static DateTime takeDate(DateTime dateTime) {
//     var res = DateTime.parse(DateFormat('yyyy-MM-dd').format(dateTime));

//     return res;
//   }

//   static bool isSameDay(DateTime? dateTime1, DateTime? dateTime2) {
//     try {
//       if (dateTime1 == null || dateTime2 == null) return false;
//       if (dateTime1.year == dateTime2.year && dateTime1.month == dateTime2.month && dateTime1.day == dateTime2.day) return true;
//     } catch (e) {
//       print(e);
//     }

//     return false;
//   }

//   static bool isBeforeDate(DateTime? dateTime1, DateTime? dateTime2) {
//     if (dateTime1 == null || dateTime2 == null) return false;
//     if (DateTime(dateTime1.year, dateTime1.month, dateTime1.day).isBefore(DateTime(dateTime2.year, dateTime2.month, dateTime2.day))) {
//       return true;
//     }

//     return false;
//   }

//   static String dateTimeToDateStr(DateTime? dt) {
//     // Datetime string-ийг форматлаад буцаана '2019.01.01T15:13:00.000' to '2019.01.01'
//     if (dt == null) return '';

//     var str = dt.toString();
//     DateTime dateTime = DateTime.parse(str);
//     String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);

//     return formattedDate; //trim(str.split(" ")[0]);
//   }

//   static String addDaysOnDateStr(String dateStr, int dayCount) {
//     // DateTime string дээр хоног нэмж, string утга буцаана
//     if (isEmpty(dateStr)) return '';
//     String formattedDate = '';

//     try {
//       DateTime dateTime = DateTime.parse(dateStr.replaceAll(".", "-"));
//       dateTime = dateTime.add(Duration(days: dayCount));
//       formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
//     } catch (e) {
//       print(e);
//     }

//     return formattedDate;
//   }

//   static bool validEmail(String value) {
//     try {
//       if (Func.isEmpty(value)) return false;
//       return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
//     } catch (e) {
//       print(e);
//     }
//     return false;
//   }

//   static double toDouble(Object? obj) {
//     double res = 0.0;
//     try {
//       if (obj == null) {
//         // nothing
//       } else if (obj is int) {
//         res = obj.toDouble();
//       } else if (obj is double) {
//         res = obj;
//       } else if (obj is String) {
//         res = double.parse(obj.replaceAll(',', ''));
//       }
//     } catch (e) {
//       print(e);
//     }
//     return res;
//   }

//   static double moneyToDouble(String? strDouble, {String thousandSeparator = ",", String rightSymbol = "", String leftSymbol = ""}) {
//     double val = 0;

//     strDouble = (strDouble == null || strDouble.isEmpty) ? '0' : strDouble;

//     strDouble = strDouble.replaceAll(thousandSeparator, '').replaceAll(rightSymbol, '').replaceAll(leftSymbol, '');

//     try {
//       val = double.parse(strDouble);
//     } catch (_) {
//       val = 0;
//     }
//     return val;
//   }

//   static int toInt(Object? obj) {
//     int res = 0;

//     try {
//       if (obj == null) {
//         // nothing
//       } else if (obj is int) {
//         res = obj;
//       } else if (obj is double) {
//         res = obj.toInt();
//       } else if (obj is String) {
//         obj = obj.replaceAll(',', '');
//         if (obj.contains('.')) {
//           res = double.parse(obj).toInt();
//         } else {
//           res = int.parse(obj);
//         }
//       }
//     } catch (e) {
//       print(e);
//     }

//     return res;
//   }

//   static double getFraction(double? value) {
//     double res = 0.0;
//     if (value != null) {
//       res = value - value.truncate();
//     }

//     return res;
//   }

//   static String removeLeadingZero(String str) {
//     if (Func.isEmpty(str)) return str;
//     String res = str;
//     try {
//       res = int.parse(str).toString();
//     } catch (e) {
//       print(e);
//     }
//     return res;
//   }

//   static bool isValidPhoneNumber(String? phoneNumber) =>
//       // phoneNumber != null && phoneNumber.length == 8 && (phoneNumber.startsWith("9") || phoneNumber.startsWith("8"));
//       true;

//   /// 2 datetime утгын хоногийн ялгааг олох
//   /// Can return null value
//   static int? dayDifference(DateTime? date1, DateTime? date2) {
//     try {
//       if (date1 != null && date2 != null) return date1.difference(date2).inDays.abs();
//     } catch (e) {
//       print(e);
//     }

//     return null;
//   }

//   static String toBase64Str(String? str) {
//     var res = '';
//     try {
//       var bytes = utf8.encode(str ?? '');
//       res = base64.encode(bytes);
//     } catch (e) {
//       print(e);
//     }

//     return res;
//   }

//   static String fromBase64Str(String? base64Str) {
//     var res = '';
//     try {
//       var bytes = base64.decode(base64Str ?? '');
//       res = utf8.decode(bytes);
//     } catch (e) {
//       print(e);
//     }

//     return res;
//   }

//   static bool isAdult(DateTime birthDate) {
//     DateTime today = DateTime.now();

//     int yearDiff = today.year - birthDate.year;
//     int monthDiff = today.month - birthDate.month;
//     int dayDiff = today.day - birthDate.day;

//     return yearDiff > 18 || yearDiff == 18 && monthDiff >= 0 && dayDiff >= 0;
//   }

//   static calculateAge(String? birthDate) {
//     var birthD = DateTime.parse(birthDate!);

//     DateTime today = DateTime.now();

//     int age = today.year - birthD.year;
//     return age;
//   }

//   static void hideKeyboard(BuildContext context) {
//     FocusScope.of(context).requestFocus(new FocusNode());
//     SystemChannels.textInput.invokeMethod('TextInput.hide'); // hide keyboard
//   }

//   static bool visibleKeyboard(BuildContext context) {
//     if (MediaQuery.of(context).viewInsets.bottom == 0) {
//       return false;
//     } else {
//       return true;
//     }
//   }

//   static int getMonthFromDateStr(String date) {
//     DateTime? _dateTime = Func.toDate(date);
//     return _dateTime!.month;
//   }

//   static String getDayFromDateStr(String date) {
//     DateTime? _dateTime;
//     _dateTime = Func.toDate(date);
//     return _dateTime!.day.toString();
//   }

//   static String toRomboMonth(int month) {
//     switch (month) {
//       case 1:
//         return "I";
//       case 2:
//         return "II";
//       case 3:
//         return "III";
//       case 4:
//         return "IV";
//       case 5:
//         return "V";
//       case 6:
//         return "VI";
//       case 7:
//         return "VII";
//       case 8:
//         return "VIII";
//       case 9:
//         return "IX";
//       case 10:
//         return "X";
//       case 11:
//         return "XI";
//       case 12:
//         return "XII";
//       default:
//         return "";
//     }
//   }

//   int daysBetween(DateTime from, DateTime to) {
//     from = DateTime(from.year, from.month, from.day);
//     to = DateTime(to.year, to.month, to.day);
//     return (to.difference(from).inDays).round();
//   }

//   static String fixedPhoneNumber(String phone) {
//     var first = phone.substring(0, 4);
//     var second = phone.substring(4);
//     return first + '-' + second;
//   }

//   static String toMoneyComma(
//     Object value, {
//     bool obscureText = false, //Secure mode ашиглах эсэх
//     NumberFormat? numberFormat,
//   }) {
//     // //print('testL:$value');

//     /// Format number with "Decimal Point" digit grouping.
//     /// 10000 -> 10,000.00
//     if (obscureText) return "***";

//     //Хоосон утгатай эсэх
//     if (Func.toStr(value) == "") {
//       return "0.00";
//     }

//     //Зөвхөн тоо агуулсан эсэх
//     String tmpStr = Func.toStr(value).replaceAll(",", "").replaceAll(".", "");
//     if (!isNumeric(tmpStr)) {
//       return "0.00";
//     }

//     //Хэрэв ',' тэмдэгт агуулсан бол устгана
//     double tmpDouble = double.parse(Func.toStr(value).replaceAll(",", ""));

//     String formattedStr = "";
//     String result = "";
//     try {
//       //Format number
//       NumberFormat formatter = numberFormat ?? NumberFormat("#,###.##");
//       result = formatter.format(tmpDouble);
//       formattedStr = result.replaceAll(',', '\'');
//     } catch (e) {
//       //print(e);
//       result = "0.00";
//     }

//     return formattedStr;
//   }

//   addItemToList({List<Challenge>? newList, List<Challenge>? existingList}) {
//     List<Challenge> list = [];
//     if (existingList != null) {
//       for (var item in newList!) {
//         bool isExist = existingList.where((element) => element.challengeId == item.challengeId).isNotEmpty;
//         if (!isExist) {
//           list.add(item);
//         }
//       }
//     }
//     return list;
//   }

//   checkUpdateVersion() async {
//     final newVersion = NewVersionPlus(iOSId: 'mn.app.habidoApp', androidId: 'mn.app.habido_app');
//     dynamic appStoreLink;
//     final status = await newVersion.getVersionStatus();
//     if (status != null) {
//       if (status.canUpdate == true) {
//         print("store ${status.appStoreLink}");
//         appStoreLink = status.appStoreLink;
//       }
//     }
//     DeeplinkUtils.launchUrl(appStoreLink);
//   }

//   notifNavigation(PushNotifModel body, RemoteNotification? notification) async {
//     switch (body.path) {
//       case NotifRouteType.Habit:
//         {
//           body.contentId == 0
//               ? NavigationKey.navKey.currentState?.pushNamed(Routes.habitCategories)
//               : NavigationKey.navKey.currentState?.pushNamed(Routes.userHabit, arguments: {
//                   'screenMode': ScreenMode.New,
//                   'habitId': body.contentId,
//                   'title': LocaleKeys.startNewHabit,
//                 });
//           break;
//         }
//       case NotifRouteType.Content:
//         {
//           body.contentId == 0
//               ? NavigationKey.navKey.currentState?.pushNamedAndRemoveUntil(Routes.home_new, ModalRoute.withName('/'), arguments: {
//                   'initialIndex': 4,
//                   'doesCheckSubs': false,
//                   'contentScreenIndex': 1,
//                 })
//               : NavigationKey.navKey.currentState?.pushNamed(Routes.contentV2, arguments: {
//                   'contentId': body.contentId,
//                 });
//           break;
//         }
//       case NotifRouteType.PsyTest:
//         {
//           body.contentId == 0
//               ? NavigationKey.navKey.currentState?.pushNamedAndRemoveUntil(Routes.home_new, ModalRoute.withName('/'), arguments: {
//                   'initialIndex': 4,
//                   'doesCheckSubs': false,
//                 })
//               : NavigationKey.navKey.currentState?.pushNamed(Routes.psyTestsIntroResult, arguments: {
//                   'testId': body.contentId,
//                 });
//           break;
//         }
//       case NotifRouteType.Challenge:
//         {
//           body.contentId == 0
//               ? NavigationKey.navKey.currentState?.pushNamedAndRemoveUntil(Routes.home_new, ModalRoute.withName('/'), arguments: {
//                   'initialIndex': 3,
//                   'doesCheckSubs': false,
//                 })
//               : NavigationKey.navKey.currentState?.pushNamed(Routes.in_progress_chall_detail, arguments: {
//                   'challengeId': body.contentId,
//                 });
//           break;
//         }
//       case NotifRouteType.MoodTracking:
//         {
//           NavigationKey.navKey.currentState?.pushNamed(Routes.feelingMain, arguments: {
//             'taskPlanId': 0,
//             'isFromChallenge': false,
//           });
//           break;
//         }
//       case NotifRouteType.NewVersion:
//         {
//           await Func().checkUpdateVersion();
//           break;
//         }
//       case NotifRouteType.Subscription:
//         {
//           NavigationKey.navKey.currentState?.pushNamed(Routes.subs_info);
//           break;
//         }
//       case NotifRouteType.Feedback:
//         {
//           Notif notif = new Notif(body: notification?.body, title: notification?.title);
//           NavigationKey.navKey.currentState?.pushNamed(Routes.notif, arguments: {'notif': notif});
//           break;
//         }
//       case NotifRouteType.HabitExecution:
//         {
//           Habit? habit;
//           String? route;
//           await GetUserHabit().getRequest(body.contentId ?? 0).then((value) => {
//                 habit = value.habit,
//                 route = HabitHelper.getProgressRoute(habit ?? Habit()),
//                 if (route != null)
//                   {
//                     NavigationKey.navKey.currentState?.pushNamed(
//                       route ?? "",
//                       arguments: {
//                         'userHabit': value,
//                       },
//                     ),
//                   }
//               });
//           break;
//         }
//       case NotifRouteType.ChallengeExecution:
//         {
//           UserTaskModel task;
//           await GetUserTaskPlan().getRequest(body.contentId ?? 0).then((value) => {
//                 task = value,
//                 navigateChallengeTask(task.challengeTaskTemplate?.challengeTaskType ?? "", task, task.challengeTaskTemplate?.challenge),
//               });
//           break;
//         }
//       case NotifRouteType.HabitPlans:
//         {
//           NavigationKey.navKey.currentState?.pushNamedAndRemoveUntil(Routes.home_new, ModalRoute.withName('/'), arguments: {
//             'initialIndex': 2,
//             'doesCheckSubs': false,
//           });
//           break;
//         }
//       case NotifRouteType.Voucher:
//         {
//           NavigationKey.navKey.currentState?.pushNamed(Routes.spend_bonus, arguments: {
//             'voucherId': body.contentId,
//           });
//           break;
//         }
//     }
//   }

//   navigateChallengeTask(String type, UserTaskModel task, Challenge? challenge) {
//     if (type == 'MoodTracking') {
//       NavigationKey.navKey.currentState?.pushNamed(Routes.feelingMain, arguments: {
//         'taskPlanId': task.taskPlanId,
//         'isFromChallenge': true,
//         'challenge': challenge,
//       });
//     } else if (type == 'ChatBot') {
//       NavigationKey.navKey.currentState?.pushNamed(Routes.chatBot, arguments: {
//         'isFromChallenge': true,
//         'taskPlanId': task.taskPlanId,
//         'challenge': challenge,
//       });
//     } else if (type == 'PsyTest') {
//       NavigationKey.navKey.currentState?.pushNamed(Routes.psyTestsIntroResult, arguments: {
//         'testId': task.challengeTaskTemplate?.hdTest?.testId,
//         'isFromChallenge': true,
//         'taskPlanId': task.taskPlanId,
//         'challenge': challenge,
//       });
//     } else if (type == 'Content') {
//       NavigationKey.navKey.currentState?.pushNamed(Routes.contentV2, arguments: {
//         'contentId': task.challengeTaskTemplate?.contentId,
//         'taskPlanId': task.taskPlanId,
//         'isFromChallenge': true,
//         'challenge': challenge,
//         'contentReadSec': task.challengeTaskTemplate?.contentReadSec,
//       });
//     } else if (type == 'Habit') {
//       Habit? planHabit = task.challengeTaskTemplate?.challengeTaskHabits?.hdHabit;

//       if (planHabit?.goalSettings != null) {
//         String? route = HabitHelper.getProgressRoute(planHabit!);

//         UserHabit userHabit = UserHabit();
//         userHabit.isDone = task.isDone;
//         userHabit.goalValue = task.challengeTaskTemplate?.challengeTaskHabits?.goalValue;
//         userHabit.goalType = planHabit.goalSettings?.goalName;
//         userHabit.habit = planHabit;
//         userHabit.name = planHabit.name;

//         if (route != null) {
//           NavigationKey.navKey.currentState?.pushNamed(route, arguments: {
//             'userHabit': userHabit,
//             'isFromChallenge': true,
//             'taskPlanId': task.taskPlanId,
//             'challenge': challenge,
//           });
//         }
//       }
//     }
//   }

//   bool checkPremium() {
//     bool result = false;
//     if (globals.userData?.subscriptionInfo?.isSubscribed == true) {
//       if (globals.userData?.subscriptionInfo?.isSubscriptionOnHold == true || globals.userData?.subscriptionInfo?.isSubscriptionExpiring == true) {
//         result = true;
//       }
//     } else if (globals.userData?.subscriptionInfo?.isSubscribed == false) {
//       result = true;
//     } else {
//       result = false;
//     }
//     return result;
//   }

//   showNotification(String message, String desc, dynamic data, RemoteNotification? notif) {
//     showOverlay((_, t) {
//       return NotificationToast(
//         message: message ?? '',
//         desc: desc ?? '',
//         data: data,
//         notification: notif,
//       );
//     }, key: ValueKey(message));
//   }
// }

// class GetUserHabit {
//   UserHabit getUrl(int userHabitId) {
//     UserHabit userHabit = new UserHabit();
//     userHabit = getRequest(userHabitId) as UserHabit;
//     return userHabit;
//   }

//   Future<UserHabit> getRequest(int userHabitId) async {
//     if (userHabitId != "") {
//       var res = await ApiManager.getUserHabitById(userHabitId);
//       if (res.code == ResponseCode.Success) {
//         return res;
//       } else {
//         return UserHabit();
//       }
//     } else {
//       return UserHabit();
//     }
//   }
// }

// class GetUserTaskPlan {
//   UserTaskModel getUrl(int userHabitId) {
//     UserTaskModel userHabit = new UserTaskModel();
//     userHabit = getRequest(userHabitId) as UserTaskModel;
//     return userHabit;
//   }

//   Future<UserTaskModel> getRequest(int userHabitId) async {
//     if (userHabitId != "") {
//       var res = await ApiManager.getUserTaskPlanById(userHabitId);
//       if (res.code == ResponseCode.Success) {
//         return res;
//       } else {
//         return UserTaskModel();
//       }
//     } else {
//       return UserTaskModel();
//     }
//   }
}
