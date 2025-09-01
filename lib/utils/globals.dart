import 'package:mobile_habido_v2/models/user_models/user_data.dart';

Globals globals = Globals();

class Globals {
  UserData? userData;
  int totalBonusPoint = 0;

  int ongoingChallengesPid = 1;
  int startChallengesPid = 1;
  int closedChallengesPid = 1;

  int myOngoingChallengesPid = 1;
  int myStartChallengesPid = 1;
  int myClosedChallengesPid = 1;

  bool isAppBarCoach = false;

  bool isCoachMark = false;

  bool challengeSoon = false;

  bool remainingDay = false;

  bool createInfo = false;

  bool inProgressInfo = false;

  bool checkCoupon = false;

  bool userHabit = false;

  bool bonusPoint = false;

  bool inappMessage = false;

  bool spendBonusCoach = false;

  // Calendar
  int? _badgeCount;

  int get calendarBadgeCount => _badgeCount ?? 0;

  set calendarBadgeCount(int? value) {
    _badgeCount = value;
  }

  // Notification
  int? _unreadNotifCount;

  // bool isShowInapp = false;

  int get unreadNotifCount => _unreadNotifCount ?? 0;

  set unreadNotifCount(int? value) {
    _unreadNotifCount = value;
  }

  // PushNotifModel? initNotif;

  void clearCachedChallenges() {
    // globals.startChallenges = [];
    // globals.closedChallenges = [];
    // globals.ongoingChallenges = [];
    // globals.myStartChallenges = [];
    // globals.myClosedChallenges = [];
    // globals.myOngoingChallenges = [];

    ongoingChallengesPid = 1;
    startChallengesPid = 1;
    closedChallengesPid = 1;

    myOngoingChallengesPid = 1;
    myStartChallengesPid = 1;
    myClosedChallengesPid = 1;
  }

  void clear() {
    // param = null;
    userData = null;
    // employmentData = null;
    calendarBadgeCount = null;
    unreadNotifCount = null;
    // zeelyConnection = null;
    // userSubscription = null;

    totalBonusPoint = 0;
    // testsWithName = [];

    clearCachedChallenges();
  }
}
