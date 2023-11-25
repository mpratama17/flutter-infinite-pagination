import 'package:get/get.dart';
import 'package:wehealth/app/data/user_repository.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final UserRepository _userRepository = UserRepository();

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
