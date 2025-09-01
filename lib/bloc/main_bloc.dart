import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_habido_v2/utils/theme/custom_color.dart';

/// ---------------------------------------------------------------------------------------------------------------------------------------------------
/// BLOC
/// ---------------------------------------------------------------------------------------------------------------------------------------------------

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(AppInit());

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is InitEvent) {
      yield* _mapInitEventToState();
    }
  }

  Stream<MainState> _mapInitEventToState() async* {
    customColors = CustomColors.light();
  }
}

/// ---------------------------------------------------------------------------------------------------------------------------------------------------
/// BLOC EVENTS
/// ---------------------------------------------------------------------------------------------------------------------------------------------------

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class InitEvent extends MainEvent {}

/// ---------------------------------------------------------------------------------------------------------------------------------------------------
/// BLOC STATES
/// ---------------------------------------------------------------------------------------------------------------------------------------------------

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class AppInit extends MainState {}
