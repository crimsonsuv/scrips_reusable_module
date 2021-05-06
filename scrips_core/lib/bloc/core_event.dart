part of 'core_bloc.dart';

@immutable
abstract class CoreEvent {}

class GetLocaleEvent extends CoreEvent {}

class SetNewLocalEvent extends CoreEvent {
  final String localeCode;
  final String localeCountry;

  SetNewLocalEvent({this.localeCode, this.localeCountry});
}

class UserDataUpdateEvent extends CoreEvent {
  final LoginUserData userData;

  UserDataUpdateEvent({this.userData});
}

class UploadProgressEvent extends CoreEvent {
  final double progress;

  UploadProgressEvent({this.progress});
}

class DashboardMenuClickEvent extends CoreEvent {
  final String menu;

  DashboardMenuClickEvent({this.menu});
}