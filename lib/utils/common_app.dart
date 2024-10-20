import 'package:design_system_sl/design_system_sl.dart';
import 'package:design_system_sl/theme/foundation/app_colors_extension.dart';
import 'package:design_system_sl/theme/foundation/app_text_theme_extension.dart';
import 'package:flutter_app/utils/navigator_key.dart';


AppTextThemeExtension get textTheme {
  return getContext.theme.appTextTheme;
}

AppColorsExtension get colorApp {
  return getContext.theme.appColors;
}
