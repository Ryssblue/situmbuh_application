import 'package:flutter/material.dart';

class DetailBalitaPage extends StatelessWidget {
  final Map<String, dynamic> data;

  const DetailBalitaPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final status = data['status'];
    Color statusColor;

    if (status == 'Stunting') {
      statusColor = Colors.red;
    } else if (status == 'Normal') {
      statusColor = Colors.green;
    } else {
      statusColor = Colors.orange;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Balita'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // HEADER CARD
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.green.withOpacity(0.15),
                      child: const Icon(
                        Icons.child_care,
                        size: 40,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      data['nama'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // DATA CARD
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _item(Icons.cake, 'Umur', '${data['umurBulan']} bulan'),
                    const Divider(),
                    _item(Icons.height, 'Tinggi Badan', '${data['tinggi']} cm'),
                    const Divider(),
                    _item(Icons.monitor_weight, 'Berat Badan', '${data['berat']} kg'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // STATUS CARD
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    const Text(
                      'Status Stunting',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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

  Widget _item(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.green),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Text(value),
      ],
    );
  }
}
