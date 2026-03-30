import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KalkulatorSepatuPage(),
    );
  }
}

class KalkulatorSepatuPage extends StatefulWidget {
  @override
  _KalkulatorSepatuPageState createState() => _KalkulatorSepatuPageState();
}

class _KalkulatorSepatuPageState extends State<KalkulatorSepatuPage> {
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController diskonController = TextEditingController();
  
  double harga = 0;
  double diskon = 0;
  double diskonRp = 0;
  double total = 0;

  final formatRupiah = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

  void hitung() {
    setState(() {
      harga = double.tryParse(hargaController.text) ?? 0;
      diskon = double.tryParse(diskonController.text) ?? 0;
      diskonRp = harga * (diskon / 100);
      total = harga - diskonRp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kalkulator Diskon Sepatu"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      controller: hargaController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Harga Sepatu",
                        prefixText: "Rp ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: diskonController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Diskon (%)",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: hitung,
                      child: Text("Hitung"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Harga Sepatu: ${formatRupiah.format(harga)}"),
                    Text("Diskon: $diskon%"),
                    Text("Diskon (Rp): ${formatRupiah.format(diskonRp)}"),
                    Divider(),
                    Text(
                      "Total Harga: ${formatRupiah.format(total)}",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green),
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