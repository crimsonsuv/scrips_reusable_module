import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class QueryParams extends Equatable {
  final String query;

  QueryParams({
    @required this.query,
  }) : super([query]);
}
