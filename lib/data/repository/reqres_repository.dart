import 'dart:math';

import 'package:dio/dio.dart';
import 'package:pm_2/data/model/reqres_model.dart';

class ReqresRepository {
  final String _baseUrl = "https://reqres.in/api/users/";

  var dio = Dio();

  Future<User> getUser() async {
    Random random = new Random();
    int randomNumber = random.nextInt(6) + 1;

    try {
      print(randomNumber);
      final response = await dio.get(_baseUrl + '$randomNumber');

      User user = User.fromJson(response.data);

      return user;
    } catch (e) {
      print(e);
      throw Exception("Failed to load user");
    }
  }
}
