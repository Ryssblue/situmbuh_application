String hitungStunting(int umurBulan, double tinggi, double berat) {
  /*
   Logika sederhana (deteksi dini):
   - Disesuaikan umur balita
   - Digunakan untuk tugas UAS (bukan diagnosis medis)
  */

  if (umurBulan < 24) {
    if (tinggi < 70 || berat < 7) {
      return 'Stunting';
    } else if (tinggi < 75 || berat < 8) {
      return 'Risiko Stunting';
    } else {
      return 'Normal';
    }
  } else {
    if (tinggi < 80 || berat < 9) {
      return 'Stunting';
    } else if (tinggi < 85 || berat < 10) {
      return 'Risiko Stunting';
    } else {
      return 'Normal';
    }
  }
}
