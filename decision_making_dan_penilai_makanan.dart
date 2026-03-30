import 'dart:io';

void main() {
  print("=== MENU PROGRAM ===");
  print("1. Penilaian Nilai (Hanya If-Else)");
  print("2. Penilaian Makanan (Switch Case)");
  print("====================");
  print("Pilih menu:");

  int pilih = int.parse(stdin.readLineSync()!);

  switch (pilih) {
    case 1:
      penilaianNilai();
      break;
    case 2:
      penilaianMakanan();
      break;
    default:
      print("Pilihan tidak tersedia");
  }
}

// #1 Hanya menggunakan If-Else (Tanpa Ternary)
void penilaianNilai() {
  print("\nMasukkan nilai (0-100):");
  int nilai = int.parse(stdin.readLineSync()!);

  print("Hasil (If-Else):");
  if (nilai < 0 || nilai > 100) {
    print("Nilai Invalid");
  } else if (nilai >= 91) {
    print("Sangat Baik");
  } else if (nilai >= 81) {
    print("Baik");
  } else if (nilai >= 71) {
    print("Cukup");
  } else if (nilai >= 61) {
    print("Kurang");
  } else {
    print("Sangat Kurang");
  }
}

// #2 Menggunakan Switch Case
void penilaianMakanan() {
  print("\nMasukkan nilai makanan (A-E):");
  String nilaiMakanan = stdin.readLineSync()!.toUpperCase();

  switch (nilaiMakanan) {
    case 'A':
      print('Sangat Enak');
      break;
    case 'B':
      print('Enak');
      break;
    case 'C':
      print('Cukup');
      break;
    case 'D':
      print('Kurang');
      break;
    case 'E':
      print('Belajar Dulu');
      break;
    default:
      print('Nilai Invalid');
  }
}
