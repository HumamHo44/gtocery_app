import 'package:flutter/material.dart';
import 'package:gtocery_app/models/product_model.dart';
import 'package:gtocery_app/screens/Product_View.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.product});
  final ProductModels product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ProductView(
                title: product.name,
                price: product.price,
                imagePath: product.image,
              );
            },
          ),
        );
      },
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Expanded(
                    flex: 2,
                    child: Center(child: Image.network(product.image)),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        product.name,
                        style: const TextStyle(
                          color: Color(0xFF1B1C1E),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Text(
                        '${product.weight}kg, \$${product.price}',
                        style: const TextStyle(
                          color: Color(0xFFFF314A),
                          fontSize: 16,

                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      trailing: const CircleAvatar(
                        backgroundColor: Color(0xFF23AA49),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
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
