import '../utils/enum_to_string.dart';

enum APP_PAGES {
  splash,
  home,
}

extension AppPageExtension on APP_PAGES {
  String toPath({bool subRoute = false}) {
    if (this == APP_PAGES.home) {
      return subRoute ? "" : "/";
    }
    return subRoute ? EnumToString.convertToString(this).toLowerCase() : "/" + EnumToString.convertToString(this).toLowerCase();
  }

  String toPathName() {
    return EnumToString.convertToString(this).toUpperCase();
  }
}