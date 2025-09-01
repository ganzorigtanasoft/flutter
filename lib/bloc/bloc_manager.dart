import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mobile_habido_v2/bloc/main_bloc.dart';

class BlocManager {
  static final mainBloc = MainBloc();
  // static final authBloc = AuthBloc();
  // static final userBloc = UserBloc();
  // static final paramBloc = ParamBloc();
  // static final chatBloc = ChatBloc();
  // static final homeBloc = HomeBloc();
  // static final psyTestMainBloc = PsyTestMainBloc();
  // static final psyTestDashboardBloc = PsyTestDashBoardBloc();
  // static final dashboardBloc = DashboardBloc();
  // static final calendarBloc = CalendarBloc();
  // static final notifBloc = NotificationBloc();
  // static final achievementBloc = AchievementBloc();
  // static final userHabitBloc = UserHabitBloc();
  // static final profileBloc = ProfileBloc();
  // static final performanceBloc = PerformanceBloc();
  // static final contentBlocV2 = ContentBlocV2();
  // static final psyTestBlocV2 = TestsBlocV2();
  // static final homeNewBloc = HomeNewBloc();
  // static final moodTrackerBloc = MoodTrackerBloc();
  // static final badgeBloc = BadgeBloc();
  // static final skillBloc = SkillBloc();
  // static final oauthBloc = OAuthBloc();
  // static final emailBloc = EmailBloc();
  // static final subscriptionBloc = SubscriptionBloc();
  // static final challengeBloc = ChallengeBloc();

  static void dispose() {
    mainBloc.close();
    // authBloc.close();
    // userBloc.close();
    // paramBloc.close();
    // chatBloc.close();
    // homeBloc.close();
    // psyTestMainBloc.close();
    // psyTestDashboardBloc.close();
    // dashboardBloc.close();
    // calendarBloc.close();
    // notifBloc.close();
    // achievementBloc.close();
    // userHabitBloc.close();
    // profileBloc.close();
    // performanceBloc.close();
    // psyTestBlocV2.close();
    // homeNewBloc.close();
    // contentBlocV2.close();
    // moodTrackerBloc.close();
    // badgeBloc.close();
    // skillBloc.close();
    // oauthBloc.close();
    // emailBloc.close();
    // subscriptionBloc.close();
    // challengeBloc.close();
  }
}

/// Custom [BlocObserver] which observes all bloc and cubit instances.
class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

class LifecycleEventHandler extends WidgetsBindingObserver {
  final MainBloc mainBloc;

  LifecycleEventHandler(this.mainBloc);

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        onPaused();
        break;
      case AppLifecycleState.resumed:
        onResume();
        break;
      case AppLifecycleState.hidden:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  void onResume() {}

  void onResumeDone(bool done) {}

  void onPaused() {}
}
