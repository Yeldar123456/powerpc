import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BalancePage(),
    );
  }
}

class BalancePage extends StatelessWidget {
  const BalancePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        elevation: 0,
        foregroundColor: Colors.white,
        title: Text("Баланс", style: TextStyle(color: Colors.white)),
      ),
      body: ProductList(),
      backgroundColor: Colors.grey.shade900,
    );
  }
}

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ProductCard(
          name: "Product 1",
          description: "Description for Product 1",
          characteristics: [
            "CPU Процессор: Intel Core i5",
            "GPU Видеокарта: NVIDIA GeForce GTX 1660",
            "RAM Оперативная память: 16GB",
            "SSD/HDD Жесткий диск: 512GB SSD",
            "PSU Блок питания: 600W",
            "Корпус: ATX Mid Tower",
            "Материнская плата: ASUS Prime Z590",
            "Охлаждение: Air Cooling",
            "Оперативная система: Windows 10",
          ],
          price: "1200",
          image: AssetImage("images/balans_image.png"),
          imageHeight: 168,
        ),
        ProductCard(
          name: "Product 2",
          description: "Description for Product 2",
          characteristics: [
            // Characteristics for Product 2
          ],
          price: "800",
          image: AssetImage("images/balans_image.png"),
          imageHeight: 168,
        ),
        ProductCard(
          name: "Product 3",
          description: "Description for Product 3",
          characteristics: [
            // Characteristics for Product 3
          ],
          price: "1500",
          image: AssetImage("images/balans_image.png"),
          imageHeight: 168,
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String description;
  final List<String> characteristics;
  final String price;
  final ImageProvider<Object> image;
  final double imageHeight;

  const ProductCard({
    required this.name,
    required this.description,
    required this.characteristics,
    required this.price,
    required this.image,
    this.imageHeight = 168,
  });

  // Function to convert price to Tenge (assuming 1 USD = 430 Tenge)
  String get priceInTenge {
    double priceTenge = double.parse(price) * 430;
    return "${priceTenge.toStringAsFixed(0)} ₸";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      color: Colors.grey.shade800,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Image(image: image, height: imageHeight, width: double.infinity, fit: BoxFit.fitHeight),
          ListTile(
            title: Text(
              name,
              style: TextStyle(color: Colors.white, fontSize: 22.0),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    description,
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: characteristics
                        .map((characteristic) => Text(
                              characteristic,
                              style: TextStyle(color: Colors.white, fontSize: 16.0),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Text(
                        "$priceInTenge",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Add to cart logic
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF13A88D)),
                      ),
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
