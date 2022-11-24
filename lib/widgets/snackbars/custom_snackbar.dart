import 'package:flutter/material.dart';
import 'package:smart_snackbars/enums/animate_from.dart';

class CustomSnackbar extends StatefulWidget {
  CustomSnackbar({
    super.key,
    required this.child,
    required this.duration,
    required this.animationCurve,
    required this.animateFrom,
    required this.childMargin,
    required this.elevation,
    required this.persist,
    required this.onDismissed,
    this.shadowColor,
  });

  Widget child;
  Duration duration;
  Curve animationCurve;
  AnimateFrom animateFrom;
  EdgeInsetsGeometry childMargin;
  double elevation;
  Color? shadowColor;
  bool persist;
  VoidCallback onDismissed;

  @override
  State<CustomSnackbar> createState() => _CustomSnackbarState();
}

class _CustomSnackbarState extends State<CustomSnackbar> {
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
        child: Container(
          padding: widget.childMargin,
          width: MediaQuery.of(context).size.width,
          child: Material(
            elevation: widget.elevation,
            shadowColor: widget.shadowColor,
            child: Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                if (widget.persist) {
                  widget.onDismissed.call();
                }
              },
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
