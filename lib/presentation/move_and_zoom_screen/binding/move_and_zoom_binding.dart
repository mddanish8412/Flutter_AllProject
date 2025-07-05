import 'package:blog/presentation/move_and_zoom_screen/controller/move_and_zoom_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MoveAndZoomScreen.
///
/// This class ensures that the MoveAndZoomController is created when the
/// MoveAndZoomScreen is first loaded.
class MoveAndZoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoveAndZoomController());
  }
}
