import 'package:data_from_api_bloc/data/models/api_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class UserState extends Equatable {}

class UserInitialState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadedState extends UserState {
  List<ApiResult> userList;
  UserLoadedState({@required this.userList});
  @override
  List<Object> get props => [];
}

class UserErrorState extends UserState {
  String message;
  UserErrorState({@required this.message});
  @override
  List<Object> get props => [];
}
