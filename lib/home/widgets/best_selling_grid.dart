import 'package:flutter/material.dart';
import 'package:gtocery_app/home/widgets/fruit_item.dart';
import 'package:gtocery_app/models/product_model.dart';

class BestSellingGrid extends StatelessWidget {
  const BestSellingGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductModels> products = [
      ProductModels(
        name: 'Bell Pepper Red',
        image: 'assets/images/pepper.png',
        weight: '1kg,',
        price: '4\$',
      ),
      ProductModels(
        name: 'Lamb Meat',
        image: 'assets/images/meatt.png',
        weight: '1kg,',
        price: '4\$',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 163 / 214,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return FruitItem(product: products[index]);
        },
      ),
    );
  }
}
