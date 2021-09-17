import 'dart:convert';

import 'package:data_from_api_bloc/api/api.dart';
import 'package:data_from_api_bloc/data/models/api_model.dart';
import 'package:http/http.dart' as http;

abstract class UserData {
  Future<List<ApiResult>> getData();
}

class UserRepoImplementation implements UserData {
  @override
  Future<List<ApiResult>> getData() async {
    var result = await http.get(Uri.parse(ApiString.apiUrl));
    if (result.statusCode == 200) {
      var jsondata = jsonDecode(result.body) as List;
      return <ApiResult>[for (var user in jsondata) ApiResult.fromJson(user)];
    } else {
      throw Exception('Network Error');
    }
  }
}
