void main() {
  print('--- 1. Pola Membesar ---');
  int n1 = 10; 
  print('# n=$n1');
  for (int i = 1; i <= n1; i++) {
    print('*' * i);
  }

  print('\n--- 2. Pola Mengecil ---');
  int n2 = 10;
  print('# n=$n2');
  for (int i = n2; i >= 1; i--) {
    print('*' * i);
  }
}