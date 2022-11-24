import 'package:smart_snackbars/widgets/snackbars/base_snackbar.dart';

class CustomSnackbar extends BaseSnackBar {
  CustomSnackbar({
    super.key,
    required child,
    required duration,
    required animationCurve,
    required animateFrom,
    required outerPadding,
    required elevation,
    required persist,
    required onDismissed,
    shadowColor,
    borderRadius,
    backgroundColor,
  }) : super(
          child: child,
          duration: duration,
          animationCurve: animationCurve,
          animateFrom: animateFrom,
          outerPadding: outerPadding,
          elevation: elevation,
          persist: persist,
          onDismissed: onDismissed,
          shadowColor: shadowColor,
          borderRadius: borderRadius,
          backgroundColor: backgroundColor,
        );
}
