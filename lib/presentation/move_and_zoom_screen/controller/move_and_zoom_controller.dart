import '../../../core/app_export.dart';
import '../models/move_and_zoom_model.dart';

/// A controller class for the MoveAndZoomScreen.
///
/// This class manages the state of the MoveAndZoomScreen, including the
/// current moveAndZoomModelObj
class MoveAndZoomController extends GetxController {
  Rx<MoveAndZoomModel> moveAndZoomModelObj = MoveAndZoomModel().obs;
}
