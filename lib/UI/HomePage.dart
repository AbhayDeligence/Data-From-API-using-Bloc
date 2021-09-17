import 'package:data_from_api_bloc/UI/detail_user.dart';
import 'package:data_from_api_bloc/bloc/articleBloc/article_bloc.dart';
import 'package:data_from_api_bloc/bloc/articleBloc/article_event.dart';
import 'package:data_from_api_bloc/bloc/articleBloc/article_state.dart';
import 'package:data_from_api_bloc/data/models/api_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // userBloc = BlocProvider.of<UserBloc>(context);
    // userBloc.add(UserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserErrorState)
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
          },
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserInitialState) {
                return SizedBox();
              } else if (state is UserLoadingState) {
                return loading();
              } else if (state is UserLoadedState) {
                return usersData(state.userList);
              } else if (state is UserErrorState) {
                return showError(state.message);
              }

              return SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Widget loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget showError(String message) {
    return Center(
      child: Text(message),
    );
  }

  Widget usersData(List<ApiResult> result) {
    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailUserScreen(result: result[index])));
          },
          child: ListTile(
            title: Text(result[index].name ?? 'name'),
            subtitle: Text(result[index].email ?? 'email'),
          ),
        );
      },
    );
  }
}
