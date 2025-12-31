import 'package:cloud_firestore/cloud_firestore.dart';

class AnalyticsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getDayWiseAnalytics() async {
    final now = DateTime.now();

    final todayStart = DateTime(now.year, now.month, now.day);
    final yesterdayStart = todayStart.subtract(const Duration(days: 1));
    final twoDaysAgo = todayStart.subtract(const Duration(days: 2));
    final threeDaysAgo = todayStart.subtract(const Duration(days: 3));

    // 🔥 Auto delete orders older than 3 days
    final oldOrders = await _firestore
        .collection('orders')
        .where(
          'orderTime',
          isLessThan: Timestamp.fromDate(threeDaysAgo),
        )
        .get();

    for (var doc in oldOrders.docs) {
      await doc.reference.delete();
    }

    // 📦 Fetch last 2 days + today orders
    final snapshot = await _firestore
        .collection('orders')
        .where(
          'orderTime',
          isGreaterThanOrEqualTo: Timestamp.fromDate(twoDaysAgo),
        )
        .get();

    Map<String, dynamic> result = {
      "today": {"total": 0, "foods": <String, int>{}},
      "yesterday": {"total": 0, "foods": <String, int>{}},
    };

    for (var doc in snapshot.docs) {
      final time = (doc['orderTime'] as Timestamp).toDate();
      final items = doc['items'] as List;
      final amount = doc['totalAmount'] as int;

      late Map<String, dynamic> bucket;

      if (time.isAfter(todayStart)) {
        bucket = result["today"];
      } else if (time.isAfter(yesterdayStart)) {
        bucket = result["yesterday"];
      } else {
        continue;
      }

      bucket["total"] += amount;

      for (var item in items) {
        final name = item['name'];
        final qty = item['qty'] as int;
        bucket["foods"][name] = (bucket["foods"][name] ?? 0) + qty;
      }
    }

    return result;
  }
}
