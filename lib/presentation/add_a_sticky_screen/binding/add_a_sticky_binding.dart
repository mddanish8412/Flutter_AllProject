import 'package:blog/presentation/add_a_sticky_screen/controller/add_a_sticky_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddAStickyScreen.
///
/// This class ensures that the AddAStickyController is created when the
/// AddAStickyScreen is first loaded.
class AddAStickyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddAStickyController());
  }
}
