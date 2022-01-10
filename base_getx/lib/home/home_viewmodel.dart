import 'package:base_getx/base/base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  var count = 0;
 @override
  onInit() {
    // fetchApi();
    print('object');
    super.onInit();
  }

  @override
  onReady() {
    // called after the widget is rendered on screen
    // showIntroDialog();
    super.onReady();
  }

  increment() {
    count++;
    update();
  }
}
