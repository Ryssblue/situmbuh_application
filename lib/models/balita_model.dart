class Balita {
  final String nama;
  final int umurBulan;
  final double tinggi;
  final double berat;
  final String status;

  Balita({
    required this.nama,
    required this.umurBulan,
    required this.tinggi,
    required this.berat,
    required this.status,
  });

  /// Convert ke Map (untuk Firestore)
  Map<String, dynamic> toMap() {
    return {
      'nama': nama,
      'umurBulan': umurBulan,
      'tinggi': tinggi,
      'berat': berat,
      'status': status,
      'createdAt': DateTime.now(),
    };
  }

  /// Ambil dari Firestore
  factory Balita.fromMap(Map<String, dynamic> map) {
    return Balita(
      nama: map['nama'],
      umurBulan: map['umurBulan'],
      tinggi: (map['tinggi'] as num).toDouble(),
      berat: (map['berat'] as num).toDouble(),
      status: map['status'],
    );
  }
}
