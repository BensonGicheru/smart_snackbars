import 'package:flutter/material.dart';
import 'package:smart_snackbars/enums/animate_from.dart';

/// An abstract widget to create a smart snackbar.
// ignore: must_be_immutable
abstract class BaseSnackBar extends StatefulWidget {
  BaseSnackBar({
    super.key,
    required this.screenWidth,
    required this.child,
    required this.duration,
    required this.animationCurve,
    required this.animateFrom,
    required this.elevation,
    required this.persist,
    this.dismissDirection,
    required this.onDismissed,
    required this.outerPadding,
    this.borderRadius,
    this.shadowColor,
    this.backgroundColor,
    this.distanceToTravelFromStartToEnd,
  });

  double screenWidth;
  Widget child;
  Duration duration;
  Curve animationCurve;
  AnimateFrom animateFrom;
  double elevation;
  Color? shadowColor;
  bool persist;
  DismissDirection? dismissDirection;
  VoidCallback onDismissed;
  EdgeInsetsGeometry outerPadding;

  BorderRadius? borderRadius;
  Color? backgroundColor;

  double? distanceToTravelFromStartToEnd;

  @override
  State<BaseSnackBar> createState() => _BaseSnackBarState();
}

class _BaseSnackBarState extends State<BaseSnackBar> {
  double? top = -150;
  double? bottom = -150;

  @override
  void setState(VoidCallback callback) {
    if(mounted) {
      super.setState(callback);
    }
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 0), () {
      if (mounted) {
        setState(() {
          if (widget.animateFrom == AnimateFrom.fromBottom) {
            bottom = widget.distanceToTravelFromStartToEnd;
          } else if (widget.animateFrom == AnimateFrom.fromTop) {
            top = widget.distanceToTravelFromStartToEnd;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int animationDuration = 2000;
    int widgetDuration = widget.duration.inMilliseconds.toInt();
    bool widgetDurationGreaterThanAnimationDuration = true;
    if(widgetDuration < animationDuration) {
      animationDuration = widgetDuration;
      widgetDurationGreaterThanAnimationDuration = false;
    }
    return AnimatedPositioned(
      bottom: widget.animateFrom == AnimateFrom.fromBottom ? bottom : null,
      top: widget.animateFrom == AnimateFrom.fromTop ? top : null,
      left: 0.0,
      right: 0.0,
      curve: widget.animationCurve,
      onEnd: widget.persist
          ? () {}
          : () {
              Future.delayed(
                Duration(
                    milliseconds: !widgetDurationGreaterThanAnimationDuration
                        ? 500
                        : ((widgetDuration + 500) - animationDuration)
                ),
                () => setState(
                  () {
                    if (widget.animateFrom == AnimateFrom.fromBottom) {
                      bottom = -150;
                    } else if (widget.animateFrom == AnimateFrom.fromTop) {
                      top = -150.0;
                    }
                  },
                ),
              );
            },
      duration: Duration(milliseconds: animationDuration),
      child: SafeArea(
        bottom: false,
        child: Dismissible(
          key: UniqueKey(),
          direction: widget.dismissDirection ?? DismissDirection.horizontal,
          onDismissed: (direction) {
            widget.onDismissed.call();
          },
          child: Container(
            padding: widget.outerPadding,
            width: widget.screenWidth,
            child: Material(
              borderRadius: widget.borderRadius,
              color: widget.backgroundColor,
              elevation: widget.elevation,
              shadowColor: widget.shadowColor,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
