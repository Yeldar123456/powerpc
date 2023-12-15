import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OrderPage(),
    );
  }
}

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // Здесь вы можете добавить логику для обработки заказа и другие необходимые переменные

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Оформление заказа'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Информация о заказе:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Добавьте элементы формы для ввода информации о заказе
            TextFormField(
              decoration: InputDecoration(labelText: 'Имя'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Адрес доставки'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Телефон'),
            ),
            SizedBox(height: 16),
            Text(
              'Выберите товары:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Добавьте элементы для выбора товаров
            // Например, можно использовать CheckboxListTile или другие виджеты
            CheckboxListTile(
              title: Text('Товар 1'),
              value: false,
              onChanged: (value) {
                // Обработка выбора товара
              },
            ),
            CheckboxListTile(
              title: Text('Товар 2'),
              value: false,
              onChanged: (value) {
                // Обработка выбора товара
              },
            ),
            SizedBox(height: 16),
            // Кнопка для отправки заказа
            ElevatedButton(
              onPressed: () {
                // Обработка оформления заказа
              },
              child: Text('Оформить заказ'),
            ),
          ],
        ),
      ),
    );
  }
}
