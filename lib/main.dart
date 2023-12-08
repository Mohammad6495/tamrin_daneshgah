import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('محاصبه گر بزرگترین مقسوم علیه مشترک :'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'عدد اول را وارد کنید'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'عدد دوم را وارد کنید'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                calculateGCD();
              },
              child: Text('محاصبه '),
            ),
            SizedBox(height: 20),
            Text('مقدار بزرگترین مقسوم علیه مشترک: $result'),
          ],
        ),
      ),
    );
  }

  void calculateGCD() {
    int num1 = int.tryParse(num1Controller.text) ?? 0;
    int num2 = int.tryParse(num2Controller.text) ?? 0;

    int gcd = GCD.calculate(num1, num2);

    setState(() {
      result = gcd.toString();
    });
  }
}

class GCD {
  static int calculate(int a, int b) {
    while (b != 0) {
      int temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }
}
