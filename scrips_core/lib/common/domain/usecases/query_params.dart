import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class QueryParams extends Equatable {
  final String query;
  final String searchFor;

  QueryParams({@required this.query, this.searchFor}) : super();

  @override
  List<Object> get props => [query, searchFor];
}
