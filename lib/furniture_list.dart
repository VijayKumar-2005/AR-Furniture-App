import 'package:ar/cart_page.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'ar_screen.dart';

class FurnitureListScreen extends StatefulWidget {
  final CameraDescription camera;

  const FurnitureListScreen({super.key, required this.camera});

  @override
  State<FurnitureListScreen> createState() => _FurnitureListScreenState();
}

class _FurnitureListScreenState extends State<FurnitureListScreen> {
  final List<Map<String, dynamic>> cart = [];

  final List<Map<String, dynamic>> furnitureItems = [
    {
      'image': 'Images/furniture1.png',
      'name': 'Modern Chair',
      'description': 'A stylish and comfortable chair for any modern space.',
      'price': 99.99,
      'rating': 4.5,
    },
    {
      'image': 'Images/furniture2.png',
      'name': 'Modern Sofa (Green)',
      'description': 'A cozy green sofa perfect for lounging or hosting.',
      'price': 299.99,
      'rating': 4.0,
    },
    {
      'image': 'Images/furniture3.png',
      'name': 'Modern Sofa (Navy Blue)',
      'description': 'Elegant navy blue sofa with plush cushioning.',
      'price': 299.99,
      'rating': 4.2,
    },
    {
      'image': 'Images/furniture4.png',
      'name': 'Modern Sofa (White)',
      'description': 'Sleek white sofa, ideal for minimalist homes.',
      'price': 299.99,
      'rating': 4.3,
    },
    {
      'image': 'Images/furniture5.png',
      'name': 'Modern Sofa (Grey)',
      'description': 'Modern grey sofa with premium fabric and support.',
      'price': 299.99,
      'rating': 4.1,
    },
    {
      'image': 'Images/furniture6.png',
      'name': 'Family Sofa',
      'description': 'Spacious family sofa designed for comfort and durability.',
      'price': 399.99,
      'rating': 4.6,
    },
    {
      'image': 'Images/furniture7.png',
      'name': 'Family Sofa (Brown)',
      'description': 'Classic brown sofa that suits all living spaces.',
      'price': 399.99,
      'rating': 4.7,
    },
    {
      'image': 'Images/furniture8.png',
      'name': 'Buddha',
      'description': 'A serene Buddha statue for peace and tranquility.',
      'price': 49.99,
      'rating': 4.8,
    },
    {
      'image': 'Images/furniture9.png',
      'name': 'Statue of Wealth',
      'description': 'A symbol of prosperity to elevate your space.',
      'price': 59.99,
      'rating': 4.5,
    },
    {
      'image': 'Images/furniture10.png',
      'name': 'Statue of Luck',
      'description': 'Invite good fortune with this beautifully crafted statue.',
      'price': 39.99,
      'rating': 4.4,
    },
    {
      'image': 'Images/furniture11.png',
      'name': 'Aesthetic Art',
      'description': 'Wall-mounted modern art piece for stylish interiors.',
      'price': 89.99,
      'rating': 4.9,
    },
    {
      'image': 'Images/furniture12.png',
      'name': 'Deer Horn',
      'description': 'Decorative deer horn sculpture with rustic charm.',
      'price': 29.99,
      'rating': 4.3,
    },
    {
      'image': 'Images/furniture13.png',
      'name': 'Swan Statue',
      'description': 'Graceful swan statue crafted with elegance.',
      'price': 49.99,
      'rating': 4.6,
    },
    {
      'image': 'Images/furniture14.png',
      'name': 'Statue of Ganesha',
      'description': 'Bless your home with this divine Ganesha statue.',
      'price': 59.99,
      'rating': 4.7,
    },
    {
      'image': 'Images/furniture15.png',
      'name': 'Hexagonal Mirrors',
      'description': 'Modern mirror set with geometric design flair.',
      'price': 79.99,
      'rating': 4.8,
    },
    {
      'image': 'Images/furniture16.png',
      'name': 'Moonlight Mirror',
      'description': 'A dreamy moon-themed mirror to elevate your space.',
      'price': 89.99,
      'rating': 4.5,
    },
    {
      'image': 'Images/furniture18.png',
      'name': "Queen's Mirror",
      'description': 'A regal mirror fit for royalty and luxury homes.',
      'price': 99.99,
      'rating': 4.6,
    },
    {
      'image': 'Images/furniture19.png',
      'name': 'Mirror of Liberty',
      'description': 'Symbolic mirror inspired by freedom and elegance.',
      'price': 79.99,
      'rating': 4.4,
    },
    {
      'image': 'Images/furniture20.png',
      'name': 'Scattered Mirror',
      'description': 'Unique design that adds a modern artistic touch.',
      'price': 69.99,
      'rating': 4.3,
    },
  ];

  double get totalPrice =>
      cart.fold(0, (sum, item) => sum + (item['price'] as double));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('@ Furnitures'),
        centerTitle: true,
        backgroundColor: Colors.black87,
        elevation: 4,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 26,
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
          Container(color: Colors.black.withAlpha(150)),
          GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.68,
            ),
            itemCount: furnitureItems.length,
            itemBuilder: (context, index) {
              final item = furnitureItems[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withAlpha(25),
                  border: Border.all(color: Colors.white.withAlpha(50)),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ARScreen(
                                camera: widget.camera,
                                selectedImage: item['image'],
                                selectedDescription: item['description'],
                                selectedName: item['name'],
                                selectedPrice: item['price'],
                                selectedRating: item['rating'],
                              ),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                          child: Image.asset(
                            item['image'],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Text(
                        item['name'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        item['description'],
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 11,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${item['price'].toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.yellowAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                item['rating'].toString(),
                                style: const TextStyle(color: Colors.white, fontSize: 13),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 3,
                          padding: const EdgeInsets.symmetric(vertical: 6),
                        ),
                        onPressed: () {
                          setState(() {
                            cart.add(item);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${item['name']} added to cart.'),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.black87,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  cart.clear();
                });
              },
              child: Icon(Icons.remove_shopping_cart_outlined,size: 25,color: Colors.red,),
            ),
            Text(
              'Items in cart: ${cart.length}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Total: \$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.yellowAccent, fontSize: 16),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartPage(cartItems: cart),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
