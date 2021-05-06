import 'package:equatable/equatable.dart';

abstract class ErrorClass extends Equatable {
  ErrorClass([List properties = const <dynamic>[]]) : super();
}

//Add here errors related to whole application
class ServerError extends ErrorClass {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CacheError extends ErrorClass {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
