import 'package:flutter/material.dart';
import 'package:smart_snackbars/widgets/snackbars/base_snackbar.dart';

/// A widget to create default styled smart snackbar.
// ignore: must_be_immutable
class TemplatedSnackbar extends BaseSnackBar {
  TemplatedSnackbar({
    super.key,
    required screenWidth,
    required title,
    required subTitle,
    required titleStyle,
    required subTitleStyle,
    required backgroundColor,
    required duration,
    required contentPadding,
    required outerPadding,
    required borderRadius,
    required animationCurve,
    required animateFrom,
    required elevation,
    required persist,
    required onDismissed,
    dismissDirection,
    titleWidget,
    subTitleWidget,
    leading,
    trailing,
    shadowColor,
    distanceToTravelFromStartToEnd,
  }) : super(
          screenWidth: screenWidth,
          shadowColor: shadowColor,
          duration: duration,
          animationCurve: animationCurve,
          animateFrom: animateFrom,
          elevation: elevation,
          persist: persist,
          dismissDirection: dismissDirection,
          onDismissed: onDismissed,
          outerPadding: outerPadding,
          backgroundColor: backgroundColor,
          borderRadius: borderRadius,
          distanceToTravelFromStartToEnd: distanceToTravelFromStartToEnd,
          child: Container(
            width: screenWidth,
            padding: contentPadding,
            child: Row(
              children: [
                if (leading != null) leading!,
                Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        title.isNotEmpty
                            ? Text(
                          title,
                          style: titleStyle,
                        )
                            : titleWidget != null
                            ? titleWidget!
                            : const SizedBox(),
                        subTitle.isNotEmpty
                            ? Text(
                          subTitle,
                          style: subTitleStyle,
                        )
                            : subTitleWidget != null
                            ? subTitleWidget!
                            : const SizedBox(),
                      ],
                    )
                ),
                if (trailing != null) trailing!,
              ],
            ),
          ),
        );
}
