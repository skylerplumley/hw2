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
        userinput = '';
        result = '';
      } else if (key == '=') {
        calcresult();
      } else {
        userinput += key;
      }
    });
  }

  void calcresult() {
    Parser parser = Parser();
    Expression exp = parser.parse(userinput);
    ContextModel context = ContextModel();
    double evaluation = exp.evaluate(EvaluationType.REAL, context);
    result = evaluation.toString();
    if (result == 'Infinity') {
      result = 'Divide by 0 Error';
    }
  }

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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(userinput,
                        style:
                            TextStyle(fontSize: 28, color: Colors.pink[600])),
                    Text(result,
                        style:
                            TextStyle(fontSize: 28, color: Colors.pink[600])),
                  ],
                )),
          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 5,
            ),
            itemCount: buttons.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4),
                child: TextButton(
                  onPressed: () => buttonpress(buttons[index]),
                  child: Text(
                    buttons[index],
                    style: TextStyle(fontSize: 22, color: Colors.pink[600]),
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
