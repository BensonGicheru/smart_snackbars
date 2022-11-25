import 'package:flutter/material.dart';
import 'package:smart_snackbars/enums/animate_from.dart';
import 'package:smart_snackbars/smart_snackbars.dart';

class DemoHelper {
  static void showTemplatedSnackbar(BuildContext context) {
    SmartSnackBars.showTemplatedSnackbar(
      context: context,
      backgroundColor: Colors.green,
      animationCurve: Curves.ease,
      animateFrom: AnimateFrom.fromTop,
      leading: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.2),
        ),
        child: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
      titleWidget: const Text(
        "Good Job",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      subTitleWidget: const Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Text(
          "Data is submitted",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
      trailing: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {},
        child: const Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    );
  }

  static void showCustomSnackBar(BuildContext context) {
    SmartSnackBars.showCustomSnackBar(
      context: context,
      persist: true,
      duration: const Duration(milliseconds: 1000),
      animationCurve: Curves.bounceOut,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.2),
              ),
              child: const Icon(
                Icons.info_outline,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              "Data is deleted",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.close,
              color: Colors.white,
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }

  static void showStickySnackBar(BuildContext context) {
    SmartSnackBars.showCustomSnackBar(
      context: context,
      duration: const Duration(milliseconds: 1000),
      animateFrom: AnimateFrom.fromBottom,
      distanceToTravel: 0.0,
      outerPadding: const EdgeInsets.all(0),
      child: Column(
        children: [
          SizedBox(
            height: 5,
            child: LinearProgressIndicator(
              backgroundColor: Colors.black.withOpacity(0.7),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            color: Colors.black.withOpacity(0.7),
            child: Row(
              children: [
                const Icon(
                  Icons.info_outline_rounded,
                  color: Colors.white,
                  size: 24,
                ),
                const SizedBox(width: 10),
                const Text(
                  "Sending Data To Server...",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    "Stop",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 20)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
