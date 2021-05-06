import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/usecase/usecase.dart';

/// base use case for creating items
abstract class CreateItemUseCase<T> extends UseCase<T, CreateItemParams> {
  CreateItemUseCase();
}

class CreateItemParams<T> extends Equatable {
  final T data;

  CreateItemParams({
    @required this.data,
  }) : super();

  @override
  // TODO: implement props
  List<Object> get props => [data];
}

abstract class CreateItemsUseCase<T> extends UseCase<T, CreateItemsParams> {
  CreateItemsUseCase();
}

class CreateItemsParams<T> extends Equatable {
  final List<T> data;

  CreateItemsParams({
    @required this.data,
  }) : super();

  @override
  List<Object> get props => [data];
}
