import 'package:get/get_connect/connect.dart';
import 'package:wehealth/app/data/user.dart';

class UserRepository extends GetConnect {
  final String _baseUrl = "https://62e7da320e5d74566afd8e74.mockapi.io/";

  Future<List<User>> fetchUsers(int page, int limit) async {
    final response = await get("${_baseUrl}users?page=$page&limit=$limit");

    final data = response.body;
    return List<User>.from(data.map((e) => User.fromJson(e)));
  }
}
