import 'package:equatable/equatable.dart';

abstract class Status extends Equatable {
  Status([List properties = const <dynamic>[]]) : super(properties);
}

class Success extends Status {
  final String message;

  Success(this.message);
}

class Failure extends Status {
  final String message;

  Failure(this.message);
}

const String parsingError =
    "Something bad happened in the background, please try after some time.";
const String serverError =
    "Something bad happened in the background, please try after some time.";
