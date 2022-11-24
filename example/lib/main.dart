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
  void showTemplatedSnackbar() {
    //context.showTemplatedSnackbar();

    context.showTemplatedSnackbar(
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
      // duration: const Duration(milliseconds: 1200),
      animationCurve: Curves.ease,
      animateFrom: AnimateFrom.fromTop,
    );
  }

  void showCustomSnackBar() {
    // context.showCustomSnackBar(animateFrom: AnimateFrom.fromTop);

    context.showCustomSnackBar(
      elevation: 5,
      child: Container(
        decoration: const BoxDecoration(color: Colors.blue),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.info_outline_rounded,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Title",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  "Sub Title",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
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
              onTap: showCustomSnackBar,
              child: Container(
                color: Colors.blue,
                padding: const EdgeInsets.all(8),
                child: const Text(
                  "Show Custom SnackBar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: showTemplatedSnackbar,
              child: Container(
                color: Colors.blue,
                padding: const EdgeInsets.all(8),
                child: const Text(
                  "Show Templated SnackBar",
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
