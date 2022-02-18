import 'package:flutter/material.dart';

double devWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double devHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

Widget verticalSpace({double value = 8}) {
  return SizedBox(height: value,);
}

Widget horizontalSpace({double value = 8}) {
  return SizedBox(width: value,);
}

ScreenSize getScreenSize(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  if (width <= ScreenSize.mobile.maxWidth()) {
    return ScreenSize.mobile;
  } else if (width <= ScreenSize.tablet.maxWidth()) {
    return ScreenSize.tablet;
  } else {
    return ScreenSize.desktop;
  }
}

double getTextSize(BuildContext context, double fontSize) {
  if (devWidth(context) > ScreenSize.desktop.maxWidth()) {
    return fontSize;
  } else if (devWidth(context) < ScreenSize.mobile.maxWidth()) {
    return ScreenSize.mobile.maxWidth() * (fontSize / ScreenSize.desktop.maxWidth());
  } else {
    return devWidth(context) * (fontSize / ScreenSize.desktop.maxWidth());
  }
}

enum ScreenSize {
  mobile,
  tablet,
  desktop
}

extension ScreenSizeExtension on ScreenSize {
  double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
  
  double maxWidth() {
    switch (this) {
      case ScreenSize.mobile:
        return 600.0;
      case ScreenSize.tablet:
        return 800.0;
      case ScreenSize.desktop:
        return 1000.0;
      default:
        return 1000.0;
    }
  }
  
  double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
  
  Size size(BuildContext context) {
    return MediaQuery.of(context).size;
  }


}