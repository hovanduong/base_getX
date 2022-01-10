import 'package:get/get_state_manager/get_state_manager.dart';

abstract class BaseViewModel extends GetxController {
  @override
  

  @override
  onClose() {
    // called just before the Controller is deleted from memory
    // closeStream();
    super.onClose();
  }
}
