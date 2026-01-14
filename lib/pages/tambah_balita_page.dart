import 'package:flutter/material.dart';
import '../models/balita_model.dart';
import '../utils/hitung_stunting.dart';
import '../services/firestore_service.dart';

class TambahBalitaPage extends StatefulWidget {
  const TambahBalitaPage({super.key});

  @override
  State<TambahBalitaPage> createState() => _TambahBalitaPageState();
}

class _TambahBalitaPageState extends State<TambahBalitaPage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _umurController = TextEditingController();
  final TextEditingController _tinggiController = TextEditingController();
  final TextEditingController _beratController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _umurController.dispose();
    _tinggiController.dispose();
    _beratController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Data Balita'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Balita',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _umurController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Umur (bulan)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _tinggiController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Tinggi Badan (cm)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _beratController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Berat Badan (kg)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),

              // 🔘 BUTTON
              ElevatedButton(
                onPressed: () async {
                  try {
                    if (_namaController.text.isEmpty ||
                        _umurController.text.isEmpty ||
                        _tinggiController.text.isEmpty ||
                        _beratController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Semua field harus diisi'),
                        ),
                      );
                      return;
                    }

                    final nama = _namaController.text;
                    final umur = int.parse(_umurController.text);
                    final tinggi = double.parse(_tinggiController.text);
                    final berat = double.parse(_beratController.text);

                    final status = hitungStunting(umur, tinggi, berat);

                    final balita = Balita(
                      nama: nama,
                      umurBulan: umur,
                      tinggi: tinggi,
                      berat: berat,
                      status: status,
                    );

                    await FirestoreService.tambahBalita(balita);

                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Data berhasil disimpan'),
                      ),
                    );

                    // kosongkan form
                    _namaController.clear();
                    _umurController.clear();
                    _tinggiController.clear();
                    _beratController.clear();
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error: $e'),
                      ),
                    );
                  }
                },
                child: const Text('Simpan & Hitung'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
