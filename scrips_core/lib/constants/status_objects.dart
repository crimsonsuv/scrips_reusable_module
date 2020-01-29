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
