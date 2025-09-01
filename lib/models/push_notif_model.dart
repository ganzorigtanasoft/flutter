// class PushNotifModel {
//   String? path;
//   int? notifHistId;
//   int? contentId;
//   UserHabit? userHabit;

//   PushNotifModel({
//     this.path,
//     this.notifHistId,
//     this.contentId,
//   });

//   PushNotifModel.fromJson(Map<String, dynamic> json) {
//     print(json['contentId'].runtimeType);
//     print(json['contentId'].toString().isNotEmpty);

//     path = json['path'];
//     notifHistId = (json['notifHistId'] != null || json['notifHistId'].toString().isNotEmpty) ? int.parse(json['notifHistId'] ?? "0") : 0;
//     contentId = (json['contentId'] != null || json['contentId'].toString().isNotEmpty) ? int.parse(json['contentId'] ?? "0") : 0;
//     userHabit = json['userHabit'] != null ? UserHabit.fromJson(json['userHabit']) : null;
//   }
// }
