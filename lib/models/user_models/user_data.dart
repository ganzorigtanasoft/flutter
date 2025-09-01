import 'package:mobile_habido_v2/helpers/base_response.dart';

class UserData extends BaseResponse {
  int? userId;
  int? habitCategoryId;
  String? phone;
  String? firstName;
  String? lastName;
  String? email;
  String? birthDay;
  String? gender;
  String? photo;
  bool? isOnboardingDone;
  bool? isOnboardingDone2;
  bool? hasOAuth2;
  bool? isRegisteredByOAuth2;
  bool? isDeclinedIntegration;
  bool hasToUpdate = false;
  int? rankId; // 1-6
  String? rankPhoto;
  String? rankName;
  String? rankBody;
  String? address;
  String? employment;
  int? oAuth2SkipCount;
  SubscriptionInfo? subscriptionInfo;

  UserData({
    this.userId,
    this.habitCategoryId,
    this.phone,
    this.firstName,
    this.lastName,
    this.email,
    this.birthDay,
    this.gender,
    this.photo,
    this.isOnboardingDone,
    this.isOnboardingDone2,
    required this.hasToUpdate,
    this.rankId,
    this.rankPhoto,
    this.rankName,
    this.rankBody,
    this.address,
    this.employment,
    this.hasOAuth2,
    this.isRegisteredByOAuth2,
    this.isDeclinedIntegration,
    this.oAuth2SkipCount,
    this.subscriptionInfo,
  });

  UserData.fromJson(dynamic json) {
    parseBaseParams(json);

    userId = json['userId'];
    habitCategoryId = json['habitCategoryId'];
    phone = json['phone'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    birthDay = json['birthDay'];
    gender = json['gender'];
    photo = json['photo'];
    isOnboardingDone = json['isOnboardingDone'];
    isOnboardingDone2 = json['isOnboardingDone2'];
    hasToUpdate = json['hasToUpdate'] ?? false;
    rankId = json['rankId'];
    rankPhoto = json['rankPhoto'];
    rankName = json['rankName'];
    rankBody = json['rankBody'];
    address = json['address'];
    employment = json['employment'];
    hasOAuth2 = json['hasOAuth2'];
    isRegisteredByOAuth2 = json['isRegisteredByOAuth2'];
    isDeclinedIntegration = json['isDeclinedIntegration'];
    oAuth2SkipCount = json['oAuth2SkipCount'];
    subscriptionInfo = json['subscriptionInfo'] != null ? SubscriptionInfo.fromJson(json['subscriptionInfo']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['phone'] = phone;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['birthDay'] = birthDay;
    map['gender'] = gender;
    map['photo'] = photo;
    map['isOnboardingDone'] = isOnboardingDone;
    map['isOnboardingDone2'] = isOnboardingDone2;
    map['hasToUpdate'] = hasToUpdate;
    map['address'] = address;
    map['employment'] = employment;
    map['hasOAuth2'] = hasOAuth2;
    map['isRegisteredByOAuth2'] = isRegisteredByOAuth2;
    map['oAuth2SkipCount'] = oAuth2SkipCount;
    map['subscriptionInfo'] = subscriptionInfo;

    return map;
  }
}

class SubscriptionInfo {
  bool? isSubscribed;
  int? remainingDays;
  bool? isSubscriptionExpiring;
  int? holdRemaningDays;
  bool? isSubscriptionOnHold;

  SubscriptionInfo({
    this.isSubscribed,
    this.remainingDays,
    this.isSubscriptionExpiring,
    this.holdRemaningDays,
    this.isSubscriptionOnHold,
  });

  SubscriptionInfo.fromJson(dynamic json) {
    isSubscribed = json['isSubscribed'];
    remainingDays = (json['remainingDays']);
    isSubscriptionExpiring = json['isSubscriptionExpiring'];
    holdRemaningDays = json['holdRemaningDays'];
    isSubscriptionOnHold = json['isSubscriptionOnHold'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['isSubscribed'] = isSubscribed;
    map['remainingDays'] = remainingDays;
    map['isSubscriptionExpiring'] = isSubscriptionExpiring;
    map['holdRemaningDays'] = holdRemaningDays;
    map['isSubscriptionOnHold'] = isSubscriptionOnHold;

    return map;
  }
}
