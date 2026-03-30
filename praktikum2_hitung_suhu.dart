import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Temp Converter',
      home: ConverterPage(),
    );
  }
}

class ConverterPage extends StatefulWidget {
  @override
  _ConverterPageState createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  final TextEditingController celciusController = TextEditingController();
  double reamur = 0;
  double fahrenheit = 0;

  void konversiSuhu() {
    double c = double.tryParse(celciusController.text) ?? 0;
    setState(() {
      reamur = (4 / 5) * c;
      fahrenheit = (9 / 5) * c + 32;
    });
  }

  void reset() {
    setState(() {
      celciusController.clear();
      reamur = 0;
      fahrenheit = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Temp Converter"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Konversi Celcius ke Reamur & Fahrenheit", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            TextField(
              controller: celciusController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Masukkan Celcius",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: konversiSuhu,
              child: Text("Konversi"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: reset,
              child: Text("Reset"),
            ),
            SizedBox(height: 20),
            Text("Reamur: $reamur °R", style: TextStyle(fontSize: 18)),
            Text("Fahrenheit: $fahrenheit °F", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Divider(),
            Text("Rumus:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Reamur = 4/5 × Celcius"),
            Text("Fahrenheit = 9/5 × Celcius + 32"),
          ],
        ),
      ),
    );
  }
}