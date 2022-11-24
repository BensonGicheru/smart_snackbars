<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

TODO: Highly Customized SnackBars and Toasts.

## Features

TODO: We will upload gifs soon.

## Getting started

TODO: Just add dependency of Notify and boom you can show SnackBars and Toasts using just Build Context's extention methods (Don't worry we will add a useful example soon).

## Usage

TODO:

```dart
context.showSnackbar(
      title: "This is Title",
      titleStyle: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      subTitleWidget: const Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Text(
          "Subtitle Widget",
          style: TextStyle(color: Colors.white),
        ),
      ),
      trailing: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            context.showToast("Toasting");
          },
          child: const Icon(
            Icons.home,
            color: Colors.black,
          )),
      duration: const Duration(milliseconds: 1000),
      animationCurve: Curves.bounceOut,
      animateFrom: AnimateFrom.fromTop,
    );
```

## Additional information

TODO: We will be more than happy of your contributions.
