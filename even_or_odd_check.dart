import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EvenOddPage(),
    );
  }
}

class EvenOddPage extends StatefulWidget {
  @override
  _EvenOddPageState createState() => _EvenOddPageState();
}

class _EvenOddPageState extends State<EvenOddPage> {
  final TextEditingController numberController = TextEditingController();
  String resultText = "Masukkan angka untuk mengecek";
  Color resultColor = Colors.grey;

  void checkNumber() {
    int? number = int.tryParse(numberController.text);
    setState(() {
      if (number == null) {
        resultText = "Input tidak valid!";
        resultColor = Colors.orange;
      } else if (number % 2 == 0) {
        resultText = "$number adalah Even Number (Genap)";
        resultColor = Colors.green;
      } else {
        resultText = "$number adalah Odd Number (Ganjil)";
        resultColor = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Even or Odd Checker"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Masukkan Angka",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkNumber,
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
              child: Text("Check Number", style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 30),
            Card(
              color: resultColor.withOpacity(0.2),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    resultText,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: resultColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}