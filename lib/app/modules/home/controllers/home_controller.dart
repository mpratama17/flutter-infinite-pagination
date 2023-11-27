import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:wehealth/app/data/user.dart';
import 'package:wehealth/app/data/user_repository.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final UserRepository _userRepository = UserRepository();
  final int _limit = 10;
  int _page = 1;
  var users = <User>[].obs;
  var hasMore = true.obs;

  Future getUser() async {
    try {
      List<User> response = await _userRepository.fetchUsers(_page, _limit);
      if (response.length < _limit) {
        hasMore.value = false;
      }

      users.addAll(response);
      _page++;
    } catch (e) {
      if (kDebugMode) print(e.toString());
    }

    Future refreshData() async {
      _page = 1;
      hasMore.value = true;
      users.value = [];
      await getUser();
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
