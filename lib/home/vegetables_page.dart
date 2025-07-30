import 'package:flutter/material.dart';
import 'package:gtocery_app/home/widgets/fruit_item.dart';
import 'package:gtocery_app/models/product_model.dart';

class VegetablesPage extends StatelessWidget {
  const VegetablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductModels> product = [
      ProductModels(
        name: 'Bell Pepper Red',
        image: 'assets/images/pepper.png',
        weight: '1kg',
        price: '4\$',
      ),
      ProductModels(
        name: 'Fresh Lettuce',
        image: 'assets/images/freshlettuce.png',
        weight: '1kg',
        price: '2\$',
      ),
      ProductModels(
        name: 'Arabic Ginger',
        image: 'assets/images/arabicginger.png',
        weight: '1kg',
        price: '4\$',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Vegetables', style: TextStyle(fontSize: 25)),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: GridView.builder(
          itemCount: product.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 163 / 214,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            return FruitItem(product: product[index]);
          },
        ),
      ),
    );
  }
}
