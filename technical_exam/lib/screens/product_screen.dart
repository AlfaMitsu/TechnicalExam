import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:technical_exam/models/details.dart';

class ProductScreen extends StatelessWidget {
  final Product product;
  const ProductScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              product.thumbnail,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                RatingBar.builder(
                  initialRating: product.rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                const SizedBox(width: 10),
                Text('(${product.rating.toStringAsFixed(2)})')
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text('Price: \$${product.price.toStringAsFixed(2)}'),
                    const SizedBox(width: 10),
                    Text('${product.discountPercentage}%'),
                  ],
                ),
                const SizedBox(height: 20),
                Text('Description: ${product.description}'),
              ],
            ),
            const SizedBox(height: 10),
            const Text('More Images:'),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (final imageUrl in product.images)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
