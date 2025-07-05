import 'package:get/get.dart';
import '../presentation/share_screen/share_screen.dart';
import '../presentation/share_screen/binding/share_binding.dart';
import '../presentation/add_a_sticky_screen/add_a_sticky_screen.dart';
import '../presentation/add_a_sticky_screen/binding/add_a_sticky_binding.dart';
import '../presentation/move_and_zoom_screen/move_and_zoom_screen.dart';
import '../presentation/move_and_zoom_screen/binding/move_and_zoom_binding.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/app_navigation_screen/binding/app_navigation_binding.dart';

class AppRoutes {
  static const String shareScreen = '/share_screen';

  static const String addAStickyScreen = '/add_a_sticky_screen';

  static const String moveAndZoomScreen = '/move_and_zoom_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: shareScreen,
      page: () => ShareScreen(),
      bindings: [
        ShareBinding(),
      ],
    ),
    GetPage(
      name: addAStickyScreen,
      page: () => AddAStickyScreen(),
      bindings: [
        AddAStickyBinding(),
      ],
    ),
    GetPage(
      name: moveAndZoomScreen,
      page: () => MoveAndZoomScreen(),
      bindings: [
        MoveAndZoomBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => ShareScreen(),
      bindings: [
        ShareBinding(),
      ],
    )
  ];
}
