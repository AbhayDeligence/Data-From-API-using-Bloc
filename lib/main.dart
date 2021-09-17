import 'package:data_from_api_bloc/bloc/articleBloc/article_bloc.dart';
import 'package:data_from_api_bloc/bloc/articleBloc/article_event.dart';
import 'package:data_from_api_bloc/data/models/api_model.dart';
import 'package:data_from_api_bloc/data/repo/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'UI/HomePage.dart';
import 'observer/observer.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserBloc(userData: UserRepoImplementation())..add(UserEvent()),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage()),
    );
  }
}
