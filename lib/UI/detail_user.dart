import 'package:data_from_api_bloc/bloc/articleBloc/article_event.dart';
import 'package:data_from_api_bloc/data/models/api_model.dart';
import 'package:flutter/material.dart';

class DetailUserScreen extends StatelessWidget {
  ApiResult result;
  DetailUserScreen({@required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(result.id.toString()),
            Text(result.website),
            Text(result.address.zipcode),
            Text(result.address.city),
            Text(result.address.city),
            Text(result.address.geo.lat),
            Text(result.address.geo.lng),
            Text(result.address.street),
            Text(result.address.suite),
            Text(result.company.bs),
            Text(result.company.catchPhrase),
            Text(result.company.name),
            Text(result.name),
            Text(result.username),
            Text(result.website),
          ],
        ),
      ),
    );
  }
}
