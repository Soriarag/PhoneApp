import 'dart:async';

import 'package:algo_app/animations/sorting/controller/selection_sort_controller.dart';
import 'package:algo_app/utils/interactive/runButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:provider/provider.dart';
import 'animations/sorting/visual/sorting_anim.dart';
import 'animations/sorting/controller/selection_sort_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calc Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Algorithms Unlocked'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => MainMenu();
}

class MainMenu extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return LayoutBuilder(builder: (_, constraints) {
      return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: MultiProvider(
          providers: [
            // here come the different algortihm controllers
            ChangeNotifierProvider(
              create: (context) =>
                  SelectionSortControl(raw_list_to_sort: [1, 3, 2, 2, 7, 5]),
            )
          ],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child:
                    Text("title", style: Theme.of(context).textTheme.headline4),
              ),
              //Cannot be const
              Expanded(
                child: Container(
                  width: constraints.maxWidth,
                  child: Center(
                    child: SortVisualizer<SelectionSortControl>(
                      key: UniqueKey(),
                      blockSize: 100,
                      width: constraints.maxWidth,
                    ),
                  ),
                ),
              ),
              runButton<SelectionSortControl>(key: UniqueKey())
            ],
          ),
        )), // This trailing comma makes auto-formatting nicer for build methods.
      );
    });
  }
}

//styles:

TextButton menuOption(String data) {
  return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.focused)) return Colors.red;
          return null; // Defer to the widget's default.
        }),
      ),
      onPressed: () {},
      child: Text(data));
}
