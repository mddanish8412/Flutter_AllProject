import '../../../core/app_export.dart';
import '../models/share_model.dart';

/// A controller class for the ShareScreen.
///
/// This class manages the state of the ShareScreen, including the
/// current shareModelObj
class ShareController extends GetxController {
  Rx<ShareModel> shareModelObj = ShareModel().obs;

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(
        AppRoutes.moveAndZoomScreen,
      );
    });
  }
}
