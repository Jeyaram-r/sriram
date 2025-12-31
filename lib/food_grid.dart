import 'package:flutter/material.dart';

class FoodGrid extends StatelessWidget {
  const FoodGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true, // important when used inside Column
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: const EdgeInsets.all(10),
      children: [
        _foodItem("Porotta", 10),
        _foodItem("Dosa", 20),
        _foodItem("Idly", 15),
        _foodItem("Chapati", 25),
      ],
    );
  }

  Widget _foodItem(String name, int price) {
    return Card(
      elevation: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text("₹$price"),
        ],
      ),
    );
  }
}
