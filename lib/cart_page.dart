import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
final List<Map<String, dynamic>> cartItems;

const CartPage({super.key, required this.cartItems});

@override
State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
List<Map<String, dynamic>> get cartItems => widget.cartItems;

double get subtotal =>
cartItems.fold(0, (sum, item) => sum + (item['price'] as double));

double get deliveryFee => 20.0;

double get total => subtotal + deliveryFee;

@override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,size: 25,color: Colors.white,),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                cartItems.clear();
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Cart has been cleared')),
              );
            },
            child: Icon(Icons.remove_shopping_cart_outlined,size: 25,color: Colors.red,),
          ),
          SizedBox(width: 20,),
        ],
        title: const Text('Your Cart'),
        backgroundColor: Colors.black87,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Stack(
        children: [
        Image.asset(
        'Images/splash_background.jpg',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
      cartItems.isEmpty
          ? const Center(
        child: Text(
          'Your cart is empty.',
          style: TextStyle(fontSize: 18,color: Colors.white),
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  leading: Image.asset(
                    item['image'],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(item['name'],style: TextStyle(color: Colors.white)),
                  subtitle: Text('\$${item['price'].toStringAsFixed(2)}'),
                  trailing: Text(
                    '⭐ ${item['rating']}',
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.black87,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 10,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SummaryRow(label: 'Subtotal', value: subtotal),
                SummaryRow(label: 'Delivery Fee', value: deliveryFee),
                const Divider(color: Colors.white30),
                SummaryRow(label: 'Total', value: total, isTotal: true),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text('Order Confirmed!'),
                          content: const Text(
                              'Thank you for your purchase. Your order will be delivered soon.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.popUntil(context, (route) => route.isFirst);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text(
                      'Confirm Order',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ]
    )
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String label;
  final double value;
  final bool isTotal;

  const SummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isTotal ? Colors.white : Colors.white70,
              fontSize: isTotal ? 18 : 15,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            '\$${value.toStringAsFixed(2)}',
            style: TextStyle(
              color: isTotal ? Colors.yellowAccent : Colors.white70,
              fontSize: isTotal ? 18 : 15,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
