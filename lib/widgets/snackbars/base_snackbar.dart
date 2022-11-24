import 'package:flutter/material.dart';
import 'package:smart_snackbars/enums/animate_from.dart';

class BaseSnackBar extends StatefulWidget {
  BaseSnackBar({
    super.key,
    required this.child,
    required this.duration,
    required this.animationCurve,
    required this.animateFrom,
    required this.elevation,
    required this.persist,
    required this.onDismissed,
    required this.outerPadding,
    this.borderRadius,
    this.shadowColor,
    this.backgroundColor,
  });

  Widget child;

  Duration duration;
  Curve animationCurve;
  AnimateFrom animateFrom;
  double elevation;
  Color? shadowColor;
  bool persist;
  VoidCallback onDismissed;
  EdgeInsetsGeometry outerPadding;

  BorderRadius? borderRadius;
  Color? backgroundColor;

  @override
  State<BaseSnackBar> createState() => _BaseSnackBarState();
}

class _BaseSnackBarState extends State<BaseSnackBar> {
  double? top = -150;
  double? bottom = -150;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 0), () {
      if (mounted) {
        setState(() {
          if (widget.animateFrom == AnimateFrom.fromBottom) {
            bottom = 20.0;
          } else if (widget.animateFrom == AnimateFrom.fromTop) {
            top = 20.0;
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
    return AnimatedPositioned(
      bottom: widget.animateFrom == AnimateFrom.fromBottom ? bottom : null,
      top: widget.animateFrom == AnimateFrom.fromTop ? top : null,
      curve: widget.animationCurve,
      onEnd: widget.persist
          ? () {}
          : () {
              Future.delayed(
                const Duration(milliseconds: 500),
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
      duration: widget.duration,
      child: SafeArea(
        child: Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            if (widget.persist) {
              widget.onDismissed.call();
            }
          },
          child: Container(
            padding: widget.outerPadding,
            width: MediaQuery.of(context).size.width,
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
