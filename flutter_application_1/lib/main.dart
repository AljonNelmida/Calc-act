import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  TextEditingController resultController = TextEditingController();

  double? _num1;
  double? _num2;

  void _add() {
    setState(() {
      if (_num1 != null && _num2 != null) {
        resultController.text = (_num1! + _num2!).toString();
      }
    });
  }

  void _subtract() {
    setState(() {
      if (_num1 != null && _num2 != null) {
        resultController.text = (_num1! - _num2!).toString();
      }
    });
  }

  void _multiply() {
    setState(() {
      if (_num1 != null && _num2 != null) {
        resultController.text = (_num1! * _num2!).toString();
      }
    });
  }

  void _divide() {
    setState(() {
      if (_num1 != null && _num2 != null) {
        if (_num2 != 0) {
          resultController.text = (_num1! / _num2!).toString();
        } else {
          resultController.text = 'Cannot divide by zero';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aljon Calc'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Enter number 1'),
              onChanged: (value) {
                _num1 = double.tryParse(value);
              },
            ),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Enter number 2'),
              onChanged: (value) {
                _num2 = double.tryParse(value);
              },
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _add,
                  child: Text('Addition'),
                ),
                ElevatedButton(
                  onPressed: _subtract,
                  child: Text('Subtraction'),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _multiply,
                  child: Text('Multiplication'),
                ),
                ElevatedButton(
                  onPressed: _divide,
                  child: Text('Division'),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: resultController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Result'),
            ),
          ],
        ),
      ),
    );
  }
}
