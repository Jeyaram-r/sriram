import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'foods.dart';
import 'admin_orders_page.dart';
import 'admin_analytics_page.dart';
import 'admin_login_page.dart';

// import 'home_page.dart'; // your HomePage file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // Navigator still works
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red, Colors.orange],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🍽️ Hotel Icon
              Image.network(
                "https://cdn-icons-png.flaticon.com/512/1046/1046784.png",
                height: 120,
              ),

              const SizedBox(height: 20),

              // 🏨 Hotel Name
              const Text(
                "Sri Ram Hotel",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 10),

              // ✨ Tagline
              const Text(
                "Taste the Tradition",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 40),

              // 🚀 Button (same navigation)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "View Menu",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  // ✅ SAME FUNCTIONALITY
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FoodsPage(),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  child: const Text("Admin Dashboard"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AdminOrdersPage(),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
  child: const Text("Daily Sales"),
  onPressed: () {
    Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const AdminLoginPage(),
  ),
);

  },
),

              

            ],
          ),
        ),
      ),
    );
  }
}
