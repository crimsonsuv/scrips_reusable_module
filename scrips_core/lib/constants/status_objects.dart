import 'package:equatable/equatable.dart';

abstract class Status extends Equatable {
  Status([List properties = const <dynamic>[]]) : super();
}

class Success extends Status {
  final String message;

  Success(this.message);

  @override
  List<Object> get props => [message];
}

class Failure extends Status {
  final String message;

  Failure(this.message);

  @override
  List<Object> get props => [message];
}

const String timeoutError =
    "Server request timeout, please check your internet connection";

const String parsingError =
    "Failed to parse server response, please try after some time.";
const String serverError =
    "Something bad happened in the background, please try after some time.";
