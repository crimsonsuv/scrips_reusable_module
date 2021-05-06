part of 'core_bloc.dart';

@immutable
abstract class CoreState {}

class InitialCoreState extends CoreState {}

class GetLocaleState extends CoreState {
  final Global data;

  GetLocaleState({@required this.data});
}

class SetNewLocalState extends CoreState {
  final Global data;

  SetNewLocalState(this.data);
}

class UserDataUpdateState extends CoreState {
  final LoginUserData userData;

  UserDataUpdateState({this.userData});
}

class UploadProgressState extends CoreState {
  final double progress;

  UploadProgressState({this.progress});
}

class DashboardMenuClickState extends CoreState {
  final String menu;

  DashboardMenuClickState({this.menu});
}