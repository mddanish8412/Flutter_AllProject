import 'package:blog/presentation/share_screen/controller/share_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ShareScreen.
///
/// This class ensures that the ShareController is created when the
/// ShareScreen is first loaded.
class ShareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShareController());
  }
}
