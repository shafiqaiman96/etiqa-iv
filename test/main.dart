import 'package:etiqa_iv/global/app_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EtiqaIV());
}

class EtiqaIV extends StatelessWidget {
  const EtiqaIV({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Etiqa Interview App',
      theme: ThemeData(
        primarySwatch: AppColors.mainColorWithSwatch,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.orangeAccent[700],
        ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add new',
        mini: true,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
