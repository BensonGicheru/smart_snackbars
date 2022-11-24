import 'package:flutter/material.dart';
import 'package:smart_snackbars/enums/animate_from.dart';

class TemplatedSnackbar extends StatefulWidget {
  TemplatedSnackbar({
    super.key,
    required this.title,
    required this.subTitle,
    required this.titleStyle,
    required this.subTitleStyle,
    required this.backgroundColor,
    required this.duration,
    required this.contentPadding,
    required this.outerPadding,
    required this.borderRadius,
    required this.animationCurve,
    required this.animateFrom,
    required this.elevation,
    required this.persist,
    required this.onDismissed,
    this.titleWidget,
    this.subTitleWidget,
    this.leading,
    this.trailing,
    this.shadowColor,
  });

  String title;
  String subTitle;
  TextStyle titleStyle;
  TextStyle subTitleStyle;

  Widget? titleWidget;
  Widget? subTitleWidget;
  Widget? leading;
  Widget? trailing;

  Color backgroundColor;

  Duration duration;

  EdgeInsetsGeometry contentPadding;
  EdgeInsetsGeometry outerPadding;

  BorderRadius borderRadius;

  Curve animationCurve;
  AnimateFrom animateFrom;

  double elevation;
  Color? shadowColor;

  bool persist;
  VoidCallback onDismissed;

  @override
  State<TemplatedSnackbar> createState() => _TemplatedSnackbarState();
}

class _TemplatedSnackbarState extends State<TemplatedSnackbar> {
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
              child: Container(
                padding: widget.contentPadding,
                child: Row(
                  children: [
                    if (widget.leading != null) widget.leading!,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.title.isNotEmpty
                            ? Text(
                                widget.title,
                                style: widget.titleStyle,
                              )
                            : widget.titleWidget != null
                                ? widget.titleWidget!
                                : const SizedBox(),
                        widget.subTitle.isNotEmpty
                            ? Text(
                                widget.subTitle,
                                style: widget.subTitleStyle,
                              )
                            : widget.subTitleWidget != null
                                ? widget.subTitleWidget!
                                : const SizedBox(),
                      ],
                    ),
                    const Spacer(),
                    if (widget.trailing != null) widget.trailing!,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
