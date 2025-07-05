import '../../../core/app_export.dart';
import '../models/add_a_sticky_model.dart';

/// A controller class for the AddAStickyScreen.
///
/// This class manages the state of the AddAStickyScreen, including the
/// current addAStickyModelObj
class AddAStickyController extends GetxController {
  Rx<AddAStickyModel> addAStickyModelObj = AddAStickyModel().obs;
}
