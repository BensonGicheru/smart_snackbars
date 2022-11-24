import 'package:flutter/material.dart';
import 'package:smart_snackbars/widgets/snackbars/base_snackbar.dart';

class TemplatedSnackbar extends BaseSnackBar {
  TemplatedSnackbar({
    super.key,
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
    titleWidget,
    subTitleWidget,
    leading,
    trailing,
    shadowColor,
  }) : super(
          shadowColor: shadowColor,
          duration: duration,
          animationCurve: animationCurve,
          animateFrom: animateFrom,
          elevation: elevation,
          persist: persist,
          onDismissed: onDismissed,
          outerPadding: outerPadding,
          backgroundColor: backgroundColor,
          borderRadius: borderRadius,
          child: Container(
            padding: contentPadding,
            child: Row(
              children: [
                if (leading != null) leading!,
                Column(
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
                ),
                const Spacer(),
                if (trailing != null) trailing!,
              ],
            ),
          ),
        );
}
