import 'package:flutter/material.dart';
import 'package:powerpc/main.dart';
import 'package:powerpc/pages/order_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> cartItems = Provider.of<CartModel>(context).cartItems;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text("Корзина"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display cart items
            Column(
              children: cartItems.map((item) => CartItem(name: item['name'], price: item['price'])).toList(),
            ),

            // Total price
            SizedBox(height: 20),
            Text(
              'Итого: \$${calculateTotalPrice(cartItems)}', // Calculate the total price dynamically
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),

            // Checkout button
            SizedBox(height: 20),
              ElevatedButton(
        onPressed: () {
          // Переход на страницу оформления заказа
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OrderPage()),
          );
        },
              child: Text('Оформить заказ'),
            ),
          ],
        ),
      ),
    );
  }

  double calculateTotalPrice(List<Map<String, dynamic>> cartItems) {
    return cartItems.fold(0, (total, item) => total + item['price']);
  }
}

class CartItem extends StatelessWidget {
  final String name;
  final double price;

  const CartItem({required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      color: Colors.grey.shade800, // Set background color for the card
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        trailing: Text(
          '\$$price',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
      ),
    );
  }
}
