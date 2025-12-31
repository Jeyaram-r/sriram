import 'package:cloud_firestore/cloud_firestore.dart';

class OrderService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveOrder(
      List<Map<String, dynamic>> cartItems, int total) async {
    await _firestore.collection("orders").add({
      "items": cartItems,
      "totalAmount": total,
      "orderTime": Timestamp.now(),
    });
  }
}
