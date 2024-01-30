import 'package:smart_snackbars/widgets/snackbars/base_snackbar.dart';

/// A widget to create smart snackbar with highly customized child.
// ignore: must_be_immutable
class CustomSnackbar extends BaseSnackBar {
  CustomSnackbar({
    super.key,
    required context,
    required child,
    required duration,
    required animationCurve,
    required animateFrom,
    required outerPadding,
    required elevation,
    required persist,
    required onDismissed,
    dismissDirection,
    distanceToTravelFromStartToEnd,
    shadowColor,
    borderRadius,
    backgroundColor,
  }) : super(
          context: context,
          child: child,
          duration: duration,
          animationCurve: animationCurve,
          animateFrom: animateFrom,
          outerPadding: outerPadding,
          elevation: elevation,
          persist: persist,
          dismissDirection: dismissDirection,
          onDismissed: onDismissed,
          shadowColor: shadowColor,
          borderRadius: borderRadius,
          backgroundColor: backgroundColor,
          distanceToTravelFromStartToEnd: distanceToTravelFromStartToEnd,
        );
}
