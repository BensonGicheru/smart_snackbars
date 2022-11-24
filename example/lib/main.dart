import 'package:flutter/material.dart';
import 'package:smart_snackbars/build_context_extensions.dart';
import 'package:smart_snackbars/enums/animate_from.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart SnackBars Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Smart SnackBars Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void showSmartSnackBar() {
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
          Icons.close,
          color: Colors.white,
        ),
      ),
      duration: const Duration(milliseconds: 1200),
      animationCurve: Curves.ease,
      animateFrom: AnimateFrom.fromTop,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: showSmartSnackBar,
              child: Container(
                color: Colors.blue,
                padding: const EdgeInsets.all(8),
                child: const Text(
                  "Show Smart SnackBar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
