import 'package:flutter/material.dart';
import 'package:smart_snackbars/enums/animate_from.dart';
import 'package:smart_snackbars/snackbar_widget.dart';
import 'package:smart_snackbars/toast_widget.dart';

extension ToastExtension on BuildContext {
  void showToast(
    String text, {
    Duration duration = const Duration(seconds: 3),
    Duration transitionDuration = const Duration(milliseconds: 250),
  }) {
    // Get the OverlayState
    final overlayState = Overlay.of(this);
    // Create an OverlayEntry with your custom widget
    final toast = OverlayEntry(
      builder: (_) => ToastWidget(
        text: text,
        transitionDuration: transitionDuration,
        duration: duration,
      ),
    );
    // then insert it to the overlay
    // this will show the toast widget on the screen
    overlayState!.insert(toast);
    // 3 secs later remove the toast from the stack
    // and this one will remove the toast from the screen
    Future.delayed(duration, toast.remove);
  }

  void showSnackbar({
    String? title,
    String? subTitle,
    TextStyle? titleStyle,
    TextStyle? subTitleStyle,
    Widget? titleWidget,
    Widget? subTitleWidget,
    Widget? leading,
    Widget? trailing,
    Color? backgroundColor,
    Duration? duration,
    EdgeInsetsGeometry? contentPadding,
    EdgeInsetsGeometry? outerPadding,
    BorderRadius? borderRadius,
    Curve? animationCurve,
    AnimateFrom? animateFrom,
  }) {
    // Get the OverlayState
    final overlayState = Overlay.of(this);
    // Create an OverlayEntry with your custom widget
    final snackBar = OverlayEntry(
      builder: (_) => SnackbarWidget(
        title: title ??= "",
        subTitle: subTitle ??= "",
        titleStyle: titleStyle ??= const TextStyle(color: Colors.white),
        subTitleStyle: subTitleStyle ??= const TextStyle(color: Colors.white),
        titleWidget: titleWidget,
        subTitleWidget: subTitleWidget,
        leading: leading,
        trailing: trailing,
        backgroundColor: backgroundColor ??= Colors.blue,
        duration: duration ??= const Duration(milliseconds: 1000),
        contentPadding: contentPadding ??= const EdgeInsets.all(20),
        borderRadius: borderRadius ??= BorderRadius.circular(10),
        animationCurve: animationCurve ??= Curves.ease,
        outerPadding: outerPadding ??=
            const EdgeInsets.symmetric(horizontal: 10),
        animateFrom: animateFrom ?? AnimateFrom.fromBottom,
      ),
    );
    // then insert it to the overlay
    // this will show the toast widget on the screen
    overlayState!.insert(snackBar);
    // 3 secs later remove the toast from the stack
    // and this one will remove the toast from the screen
    Future.delayed(duration! * 2, snackBar.remove);
  }
}
