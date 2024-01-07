import 'package:get/get.dart';

class MainController extends GetxController {
  final RxBool _isMenuOpen = false.obs;

  RxDouble get width => Get.mediaQuery.size.width.obs;
  RxDouble get height => Get.mediaQuery.size.height.obs;

  double get scaleFactor => width.value <= 600
      ? 0.7 // Mobile
      : width.value <= 800
          ? 0.8 // Tablet
          : 1.5; // Desktop

  double get responsiveFontSizeHeading => scaleFactor * 10.0;
  double get responsiveFontSizeBodyHeading => scaleFactor * 50.0;
  bool get isMobile => width.value <= 600;
  bool get isTablet => width.value <= 1200 && width.value >= 600;
  bool get isDesktop => width.value >= 1200;

  bool get isMenuOpen => _isMenuOpen.value;

  double widgetWidthSize() => isMobile
      ? 100 * scaleFactor
      : isTablet
          ? scaleFactor * 150
          : 200;
  double widgetHeightSize() => isMobile
      ? 50 * scaleFactor
      : isTablet
          ? scaleFactor * 100
          : 150;
}
