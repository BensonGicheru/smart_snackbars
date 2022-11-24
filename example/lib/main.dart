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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final int _counter = 0;

  void _incrementCounter() {
    // CustomToast.showCustomToast(context: context);
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
