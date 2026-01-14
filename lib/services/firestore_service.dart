import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/balita_model.dart';

class FirestoreService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> tambahBalita(Balita balita) async {
    await _db.collection('balita').add(balita.toMap());
  }
}
