import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: Colors.pink[50]),
      debugShowCheckedModeBanner: false,
      title: 'Calculator App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String userinput = '';
  String result = '';

  final List<String> buttons = [
    '0',
    '1',
    '2',
    '+',
    '3',
    '4',
    '5',
    '-',
    '6',
    '7',
    '8',
    '*',
    '9',
    'C',
    '=',
    '/'
  ];

  void buttonpress(String key) {
    setState(() {
      if (key == 'C') {
        userinput = 'Cleared';
        result = 'Cleared';
      } else if (key == '=') {
        calcresult();
      } else {
        userinput += key;
      }
    });
  }

  void calcresult() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                )),
          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 4,
            ),
            itemCount: buttons.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(3),
                child: TextButton(
                  onPressed: () => buttonpress(buttons[index]),
                  child: Text(
                    buttons[index],
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
