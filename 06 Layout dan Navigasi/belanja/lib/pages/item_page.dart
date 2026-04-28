import 'package:flutter/material.dart';
import '../models/item.dart';
import '../widgets/footer_widget.dart';

class ItemPage extends StatelessWidget {
  final Item item;

  const ItemPage({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Hero(
                  tag: item.name,
                  child: Image.network(
                    item.imageUrl,
                    width: double.infinity,
                    height: 280,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Rp ${item.price}',
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                item.rating.toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(width: 24),
                              const Icon(
                                Icons.inventory,
                                color: Colors.green,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Stok: ${item.stock}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Deskripsi Produk',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${item.name} merupakan produk belanja pilihan '
                            'dengan kualitas baik dan harga terjangkau. '
                            'Produk ini tersedia dengan stok sebanyak '
                            '${item.stock} item dan memiliki rating '
                            '${item.rating}.',
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const FooterWidget(),
        ],
      ),
    );
  }
}