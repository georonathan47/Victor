import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DashboardEntity extends Equatable {
  final String? title;
  final String? image;

  DashboardEntity({
    @required this.title,
    @required this.image,
  });
  @override
  // TODO: implement props
  List<Object> get props => [title!, image!];
}
