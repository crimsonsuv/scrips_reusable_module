import 'package:equatable/equatable.dart';

abstract class ErrorClass extends Equatable {
  ErrorClass([List properties = const <dynamic>[]]) : super(properties);
}

//Add here errors related to whole application
class ServerError extends ErrorClass {}

class CacheError extends ErrorClass {}
