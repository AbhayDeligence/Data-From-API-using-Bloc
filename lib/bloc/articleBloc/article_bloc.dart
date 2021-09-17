import 'package:bloc/bloc.dart';
import 'package:data_from_api_bloc/bloc/articleBloc/article_event.dart';
import 'package:data_from_api_bloc/bloc/articleBloc/article_state.dart';
import 'package:data_from_api_bloc/data/models/api_model.dart';
import 'package:data_from_api_bloc/data/repo/repositories.dart';
import 'package:flutter/material.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserData userData;
  UserBloc({@required this.userData}) : super(UserInitialState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserEvent) {
      yield UserLoadingState();
      try {
        List<ApiResult> data = await userData.getData();
        yield UserLoadedState(userList: data);
      } catch (e) {
        yield UserErrorState(message: e.toString());
      }
    }
  }
}
