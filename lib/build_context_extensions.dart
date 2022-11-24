import 'package:flutter/material.dart';
import 'package:smart_snackbars/enums/animate_from.dart';
import 'package:smart_snackbars/widgets/snackbars/custom_snackbar.dart';
import 'package:smart_snackbars/widgets/snackbars/templated_snackbar.dart';
import 'package:smart_snackbars/toast_widget.dart';

extension ToastExtension on BuildContext {
  void showTemplatedSnackbar({
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
    double? elevation,
    Color? shadowColor,
  }) {
    duration ??= const Duration(milliseconds: 1000);

    // Get the OverlayState
    final overlayState = Overlay.of(this);
    // Create an OverlayEntry with your custom widget
    final snackBar = OverlayEntry(
      builder: (_) => TemplatedSnackbar(
        title: title ??= "",
        subTitle: subTitle ??= "",
        titleStyle: titleStyle ??= const TextStyle(color: Colors.white),
        subTitleStyle: subTitleStyle ??= const TextStyle(color: Colors.white),
        titleWidget: titleWidget,
        subTitleWidget: subTitleWidget,
        leading: leading,
        trailing: trailing,
        backgroundColor: backgroundColor ??= Colors.blue,
        duration: duration!,
        contentPadding: contentPadding ??= const EdgeInsets.all(20),
        borderRadius: borderRadius ??= BorderRadius.circular(10),
        animationCurve: animationCurve ??= Curves.ease,
        outerPadding: outerPadding ??=
            const EdgeInsets.symmetric(horizontal: 10),
        animateFrom: animateFrom ??= AnimateFrom.fromBottom,
        elevation: elevation ??= 0.0,
        shadowColor: shadowColor,
      ),
    );
    // then insert it to the overlay
    // this will show the toast widget on the screen
    overlayState!.insert(snackBar);
    // 3 secs later remove the toast from the stack
    // and this one will remove the toast from the screen
    Future.delayed(duration * 2, snackBar.remove);
  }

  void showCustomSnackBar({
    Widget? child,
    Duration? duration,
    Curve? animationCurve,
    AnimateFrom? animateFrom,
    EdgeInsetsGeometry? childMargin,
    double? elevation,
    Color? shadowColor,
  }) {
    duration ??= const Duration(milliseconds: 1000);

    // Get the OverlayState
    final overlayState = Overlay.of(this);
    // Create an OverlayEntry with your custom widget
    final snackBar = OverlayEntry(
      builder: (_) => CustomSnackbar(
        duration: duration ??= const Duration(milliseconds: 1000),
        animationCurve: animationCurve ??= Curves.ease,
        animateFrom: animateFrom ??= AnimateFrom.fromBottom,
        childMargin: childMargin ??= const EdgeInsets.symmetric(horizontal: 10),
        elevation: elevation ??= 0.0,
        shadowColor: shadowColor,
        child: child ??= Container(
          width: MediaQuery.of(this).size.width,
          padding: const EdgeInsets.all(10),
          color: Colors.blue,
          child: const Text(
            "Create Your Custom SnackBar",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
    // then insert it to the overlay
    // this will show the toast widget on the screen
    overlayState!.insert(snackBar);
    // 3 secs later remove the toast from the stack
    // and this one will remove the toast from the screen
    Future.delayed(duration! * 2, snackBar.remove);
  }

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
}
