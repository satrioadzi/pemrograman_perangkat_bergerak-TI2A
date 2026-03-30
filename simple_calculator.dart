import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Calculator',
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  String hasil = "0";

  void hitung(String operasi) {
    double num1 = double.tryParse(num1Controller.text) ?? 0;
    double num2 = double.tryParse(num2Controller.text) ?? 0;
    
    setState(() {
      if (operasi == '+') {
        hasil = "${num1 + num2}";
      } else if (operasi == '-') {
        hasil = "${num1 - num2}";
      } else if (operasi == '*') {
        hasil = "${num1 * num2}";
      } else if (operasi == '/') {
        if (num2 == 0) {
          hasil = "Error: Tidak bisa dibagi nol";
        } else {
          hasil = "${num1 / num2}";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Calculator"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Angka Pertama", border: OutlineInputBorder()),
            ),
            SizedBox(height: 15),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Angka Kedua", border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () => hitung('+'), child: Text("+", style: TextStyle(fontSize: 20))),
                ElevatedButton(onPressed: () => hitung('-'), child: Text("-", style: TextStyle(fontSize: 20))),
                ElevatedButton(onPressed: () => hitung('*'), child: Text("x", style: TextStyle(fontSize: 20))),
                ElevatedButton(onPressed: () => hitung('/'), child: Text("/", style: TextStyle(fontSize: 20))),
              ],
            ),
            SizedBox(height: 30),
            Text("Hasil:", style: TextStyle(fontSize: 20, color: Colors.grey)),
            Text(hasil, style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}