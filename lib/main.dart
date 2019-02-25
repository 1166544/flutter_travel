import 'package:flutter/material.dart';

void main() => runApp(TravelApp());

class TravelApp extends StatelessWidget {
  // 程序根目录
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel gram',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TravelHomePage(title: 'Travel gram'),
    );
  }
}

/// 入口类
class TravelHomePage extends StatefulWidget {
  /// 构造参数
  TravelHomePage({Key key, this.title}) : super(key: key);

  final String title;

  /// STATE事件注册
  @override
  _TravelHomePageState createState() => _TravelHomePageState();
}

class _TravelHomePageState extends State<TravelHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  /// 构建
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
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increments',
        child: Icon(Icons.add),
      ),
    );
  }
}
