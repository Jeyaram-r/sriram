import 'package:flutter/material.dart';
import 'cart_page.dart';

class FoodsPage extends StatefulWidget {
  const FoodsPage({super.key});

  @override
  State<FoodsPage> createState() => _FoodsPageState();
}

class _FoodsPageState extends State<FoodsPage> {
  final List<Map<String, dynamic>> foods = [
    {
      "name": "Dosa",
      "price": 10,
      "qty": 1,
      "img":
          "https://i0.wp.com/www.chitrasfoodbook.com/wp-content/uploads/2020/12/setdosarecipe-1.jpg?ssl=1"
    },
    {
      "name": "Spl Dosa",
      "price": 20,
      "qty": 1,
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPwLD011gcA9B580EysxYs2E7t1_EVdAiaAg&s"
    },
    {
      "name": "Idly",
      "price": 7,
      "qty": 1,
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8sV2U3wyfo1Gjy0Jncd9CsTYorvWNWTxTHA&s"
    },
    {
      "name": "Egg Dosa",
      "price": 30,
      "qty": 1,
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRb1VFjI7FsvfMK2YWi8yEzEgcAMayiCMCiaw&s"
    },
    {
      "name": "Aapam",
      "price": 10,
      "qty": 1,
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPBABehAue_0LhmndMY2Y_EoIBqkZXnPNjjQ&s"
    },
    {
      "name": "Poori",
      "price": 10,
      "qty": 1,
      "img":
          "https://i0.wp.com/www.chitrasfoodbook.com/wp-content/uploads/2013/11/poori-picture_thumb3.jpg?ssl=1"
    },
    {
      "name": "Vadai",
      "price": 10,
      "qty": 1,
      "img":
          "https://i0.wp.com/www.chitrasfoodbook.com/wp-content/uploads/2013/12/masala-vada-recipe.jpg?w=1200&ssl=1"
    },
    {
      "name": "Omlete",
      "price": 15,
      "qty": 1,
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKzwPTQyYq5iGOaCvEvDd1IHw0sXWo0dmoZA&s"
    },
    {
      "name": "Porotta",
      "price": 10,
      "qty": 1,
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuqJE2E62rmPGYxFQAdEAwCQtN0Uk7HcntdQ&s"
    },
    {
      "name": "Briyani(Egg)",
      "price": 50,
      "qty": 1,
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIB33s76dqCpEZsqISH9G1mbLRTXtYEgnvWA&s"
    },
     {
      "name": "Empty Briyani",
      "price": 40,
      "qty": 1,
      "img":
          "https://www.yummytummyaarthi.com/wp-content/uploads/2022/07/chicken-biryani-1-500x375.jpeg"
    },
    {
      "name": "Chicken Curvy",
      "price": 55,
      "qty": 1,
      "img":
          "https://feastwithsafiya.com/wp-content/uploads/2022/03/chicken-curry-recipe.jpg"
    },
    {
      "name": "Chicken Fry",
      "price": 70,
      "qty": 1,
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvo-SGu27kaUw0_m1-NOQ1PF0bmqXj_gP5Zg&s"
    },
    {
      "name": "Kothu Porotta",
      "price": 70,
      "qty": 1,
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToXj4oYmC5ODHeA7Y0_n-gByV7KVVDKiOZhA&s"
    },
    {
      "name": "Egg Fry",
      "price": 40,
      "qty": 1,
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgrH-PkaDEH6HWdztsOSbVbUZKTyO96o-6aw&s"
    },
    {
      "name": "Chappathi",
      "price": 10,
      "qty": 1,
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_WbIWay5NLGqrM8x_yMv0FpC7Huje0jfTgA&s"
    },
  ];

  List<Map<String, dynamic>> cart = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Sri Ram Hotel",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(foods.length, (index) {
            return foodItem(index);
          }),
        ),
      ),
      bottomNavigationBar: Padding(
        
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.all(15),
          ),
          onPressed: cart.isEmpty
              ? null
              : () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(cartItems: cart),
                    ),
                  );
                },
          child: const Text(
            "Proceed",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget foodItem(int index) {
    final food = foods[index];

    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image.network(
              food["img"],
              height: 80,
              width: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food["name"],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${food["qty"]} × ₹${food["price"]} = ₹${food["qty"] * food["price"]}",
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        if (food["qty"] > 1) {
                          setState(() => food["qty"]--);
                        }
                      },
                    ),
                    Text(food["qty"].toString()),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() => food["qty"]++);
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      cart.removeWhere((item) => item["name"] == food["name"]);
                      cart.add(Map.from(food));
                    });
                  },
                  child: const Text("Add to Cart"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
