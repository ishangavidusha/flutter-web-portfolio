import '../utils/enum_to_string.dart';

enum Pages {
  splash,
  home,
}

extension AppPageExtension on Pages {
  String toPath({bool subRoute = false}) {
    if (this == Pages.home) {
      return subRoute ? "" : "/";
    }
    return subRoute ? EnumToString.convertToString(this).toLowerCase() : "/${EnumToString.convertToString(this).toLowerCase()}";
  }

  String toPathName() {
    return EnumToString.convertToString(this).toUpperCase();
  }
}