import 'package:dio/dio.dart';
import 'package:pm_2/data/model/user_model.dart';

class UserRepository {
  var _dio = Dio();
  final String _baseUrl = 'http://nscis.nsctechnology.com/index.php?r=biu-test';

  Future<String> addUser(String nama, alamat) async {
    try {
      var formData = FormData.fromMap({"nama": nama, "alamat": alamat});

      final String url = _baseUrl + '/create';
      Response response = await _dio.post(url, data: formData);

      return "Success add data";
    } catch (e, stacktrace) {
      throw Exception("Exception occured: $e stackTrace: $stacktrace");
    }
  }

  Future<String> deleteUser(String id) async {
    try {
      var formData = FormData.fromMap({"id": id});
      final String url = _baseUrl + '/delete';

      Response response = await _dio.post(url, data: formData);

      final res = UserModelDelete.fromJson(response.data);

      return res.message;
    } catch (e, stacktrace) {
      throw Exception("Exception occured: $e stackTrace: $stacktrace");
    }
  }

  Future<String> editUser(String id, nama, alamat) async {
    try {
      var formData =
          FormData.fromMap({"id": id, "nama": nama, "alamat": alamat});

      final String url = _baseUrl + '/update';
      Response response = await _dio.post(url, data: formData);

      final res = UserModelEdit.fromJson(response.data);

      return res.message;
    } catch (e, stacktrace) {
      throw Exception("Exception occured: $e stackTrace: $stacktrace");
    }
  }

  Future<List<UserModel>> fetchUser() async {
    try {
      final String url = _baseUrl + '/list';
      Response response = await _dio.get(url);

      return (response.data as List)
          .map((user) => UserModel.fromJson(user))
          .toList();
    } catch (e, stacktrace) {
      throw Exception("Exception occured: $e stackTrace: $stacktrace");
    }
  }

  Future<UserModel> getUserByID(String id) async {
    try {
      final String url = _baseUrl + '/view';
      Map<String, dynamic> queryParams = {'id': id};

      Response response = await _dio.get(url, queryParameters: queryParams);

      return UserModel.fromJson(response.data);
    } catch (e, stacktrace) {
      throw Exception("Exception occured: $e stackTrace: $stacktrace");
    }
  }
}
