import 'package:flutter/material.dart';

void main() => runApp(const MyCalculator());

class MyCalculator extends StatelessWidget {
  const MyCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Calculator();
  }
}

class _Calculator extends State<Calculator> {
  String text = '0';
  double numOne = 0;
  double numTwo = 0;
  String result = '0';
  String finalresult = '0';
  String opr = '';
  String preOpr = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.black87,
      body: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // const SizedBox(height: 300),
            Row(
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: const TextStyle(color: Colors.white70, fontSize: 60),
                    maxLines: 1,
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button3("C", const Color(0xff232c33)),
                button("%", const Color(0xff232c33)),
                button("/", const Color(0xffad68ac)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("7", const Color(0xff232c33)),
                button("8", const Color(0xff232c33)),
                button("9", const Color(0xff232c33)),
                button("x", const Color(0xffad68ac)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("4", const Color(0xff232c33)),
                button("5", const Color(0xff232c33)),
                button("6", const Color(0xff232c33)),
                button("-", const Color(0xffad68ac)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("1", const Color(0xff232c33)),
                button("2", const Color(0xff232c33)),
                button("3", const Color(0xff232c33)),
                button("+", const Color(0xffad68ac)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button2("0", const Color(0xff232c33)),
                button(".", const Color(0xff232c33)),
                button("=", const Color(0xff3fe0ba)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget button(String btnTxt, Color color) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: () {
          setState(() {
            calculate(btnTxt);
          });
        },
        child: Text(
          btnTxt,
          style: const TextStyle(fontSize: 30),
        ),
        color: color,
        padding: const EdgeInsets.all(20),
        shape: const CircleBorder(),
      ),
    );
  }

  Widget button2(String btnTxt, Color color) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: () {
          setState(() {
            calculate(btnTxt);
          });
        },
        child: Text(
          btnTxt,
          style: const TextStyle(fontSize: 35),
        ),
        color: color,
        padding:
        const EdgeInsets.only(left: 81, top: 20, right: 81, bottom: 20),
        shape: const StadiumBorder(),
      ),
    );
  }

  Widget button3(String btnTxt, Color color) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: () {
          setState(() {
            calculate(btnTxt);
          });
        },
        child: Text(
          btnTxt,
          style: const TextStyle(fontSize: 30, color: Color(0xff69333e)),
        ),
        color: color,
        padding: const EdgeInsets.all(20),
        shape: const CircleBorder(),
      ),
    );
  }

  void calculate(txtBtn) {
    if (txtBtn == 'C') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '0';
      finalresult = '0';
      opr = '';
      preOpr = '';
    } else if (txtBtn == '%') {
      result = (numOne / 100).toString();
      finalresult = result;
    } else if (opr == '=' && txtBtn == '=') {
      switch (preOpr) {
        case '+':
          finalresult = add();
          break;
        case '-':
          finalresult = sub();
          break;
        case 'x':
          finalresult = mul();
          break;
        case '/':
          finalresult = div();
          break;
      }
    } else if (txtBtn == '+' ||
        txtBtn == '-' ||
        txtBtn == 'x' ||
        txtBtn == '/' ||
        txtBtn == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }
      switch (opr) {
        case '+':
          finalresult = add();
          break;
        case '-':
          finalresult = sub();
          break;
        case 'x':
          finalresult = mul();
          break;
        case '/':
          finalresult = div();
          break;
      }
      preOpr = opr;
      opr = txtBtn;
      result = '';
    } else if (txtBtn == '.') {
      if (!result.contains('.')) {
        result + '.';
        finalresult = result;
      }
    } else if (result == '0') {
      result = txtBtn;
    } else {
      result = result + txtBtn;
      finalresult = result;
    }

    setState(() {
      text = finalresult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return result;
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return result;
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return result;
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return result;
  }
}
