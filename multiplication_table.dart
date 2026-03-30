import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiplicationPage(),
    );
  }
}

class MultiplicationPage extends StatefulWidget {
  @override
  _MultiplicationPageState createState() => _MultiplicationPageState();
}

class _MultiplicationPageState extends State<MultiplicationPage> {
  final TextEditingController numberController = TextEditingController();
  List<String> tableData = [];

  void generateTable() {
    int? number = int.tryParse(numberController.text);
    setState(() {
      tableData.clear();
      if (number != null) {
        for (int i = 1; i <= 10; i++) {
          tableData.add("$number x $i = ${number * i}");
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multiplication Table"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Angka Perkalian (misal: 5)",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: generateTable,
              child: Text("Generate Table"),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: tableData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(tableData[index], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      leading: Icon(Icons.calculate, color: Colors.blue),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}