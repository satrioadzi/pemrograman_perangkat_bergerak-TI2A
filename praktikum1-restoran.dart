void main() {
  // 1 & 2. Tentukan variabel dan isi datanya
  String nama = "Electra Seafood";
  int tahun = 2023;
  String pemilik = "Mbok Yem";
  String alamat = "JL. Prof. Soedarto, SH, Tembalang";
  bool statusBuka = true; // true untuk Buka, false untuk Tutup
  
  // Menggunakan List of Maps untuk Daftar Makanan dan Minuman
  List<Map<String, dynamic>> daftarMakanan = [
    {'nama': 'Kepiting Rebus', 'harga': 40000},
    {'nama': 'Nasi Goreng', 'harga': 20000},
    {'nama': 'Udang Asam Manis', 'harga': 50000},
    {'nama': 'Sate Cumi', 'harga': 30000}
  ];

  List<Map<String, dynamic>> daftarMinuman = [
    {'nama': 'Es Jeruk', 'harga': 5000},
    {'nama': 'Es Teh', 'harga': 2000},
    {'nama': 'Es Jus', 'harga': 6000}
  ];

  // Menggabungkan semuanya dalam satu Map besar agar sesuai dengan "Hasil Running" di soal
  Map<String, dynamic> restoran = {
    'nama': nama,
    'tahun': tahun,
    'pemilik': pemilik,
    'alamat': alamat,
    'status': statusBuka,
    'daftarMakanan': daftarMakanan,
    'daftarMinuman': daftarMinuman
  };

  // 3. Cetak data restoran
  print(restoran);
}