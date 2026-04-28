import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/item.dart';
import '../widgets/footer_widget.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Item> items = [
    Item(
      name: 'Sugar',
      price: 5000,
      imageUrl: 'https://picsum.photos/seed/sugar/600/600',
      stock: 20,
      rating: 4.5,
    ),
    Item(
      name: 'Salt',
      price: 2000,
      imageUrl: 'https://picsum.photos/seed/salt/600/600',
      stock: 35,
      rating: 4.2,
    ),
    Item(
      name: 'Rice',
      price: 12000,
      imageUrl: 'https://picsum.photos/seed/rice/600/600',
      stock: 15,
      rating: 4.8,
    ),
    Item(
      name: 'Cooking Oil',
      price: 18000,
      imageUrl: 'https://picsum.photos/seed/oil/600/600',
      stock: 10,
      rating: 4.6,
    ),
    Item(
      name: 'Egg',
      price: 25000,
      imageUrl: 'https://picsum.photos/seed/egg/600/600',
      stock: 18,
      rating: 4.7,
    ),
    Item(
      name: 'Instant Noodle',
      price: 3500,
      imageUrl: 'https://picsum.photos/seed/noodle/600/600',
      stock: 50,
      rating: 4.9,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Marketplace'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.72,
              ),
              itemBuilder: (context, index) {
                final item = items[index];

                return ProductCard(
                  item: item,
                  onTap: () {
                    context.push('/item', extra: item);
                  },
                );
              },
            ),
          ),
          const FooterWidget(),
        ],
      ),
    );
  }
}