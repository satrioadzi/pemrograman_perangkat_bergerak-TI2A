import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: CirclePage());
  }
}

class CirclePage extends StatefulWidget {
  @override
  _CirclePageState createState() => _CirclePageState();
}

class _CirclePageState extends State<CirclePage> {
  final TextEditingController controller = TextEditingController();
  double luas = 0;
  double keliling = 0;

  void hitung() {
    if (controller.text.isEmpty) return;
    double r = double.parse(controller.text);
    setState(() {
      luas = pi * r * r;
      keliling = 2 * pi * r;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Circle Calculator"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      "Rumus Lingkaran",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Luas = π × r × r"),
                    Text("Keliling = 2 × π × r"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Masukkan jari-jari (radius)",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.circle),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: hitung, child: Text("Hitung")),
            SizedBox(height: 20),
            Card(
              color: Colors.blue.shade50,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      "Hasil Perhitungan",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Luas (Area): ${luas.toStringAsFixed(2)}"),
                    Text(
                      "Keliling (Circumference): ${keliling.toStringAsFixed(2)}",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
