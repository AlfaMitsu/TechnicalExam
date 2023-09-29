import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:technical_exam/models/details.dart';
import 'package:technical_exam/screens/product_screen.dart';
import 'package:technical_exam/services/details_api_service.dart';

class DetailsScreen extends StatelessWidget {
  final DetailsApiService productService =
      DetailsApiService('https://dummyjson.com/products');

  DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: FutureBuilder<List<Product>>(
        future: productService.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final products = snapshot.data;
            return ListView.builder(
              itemCount: products?.length,
              itemBuilder: (context, index) {
                final product = products![index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(product: product),
                      ),
                    );
                  },
                  leading: Image.network(
                    product.thumbnail,
                    width: 100,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Description: ${product.description}'),
                      Text('Price: \$${product.price.toStringAsFixed(2)}'),
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
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
