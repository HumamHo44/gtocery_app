import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gtocery_app/models/product_model.dart';
import 'package:gtocery_app/screens/Product_View.dart';
import 'package:gtocery_app/theme_manager.dart';
import 'package:provider/provider.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.product});
  final ProductModels product;

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductView(
              title: product.name,
              price: product.price.toString(),
              imagePath: product.image,
              weight: product.weight,
            ),
          ),
        );
      },
      child: Container(
        decoration: ShapeDecoration(
          color: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
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
                        style: TextStyle(
                          color: themeManager.themeMode == ThemeMode.dark
                              ? Colors.white
                              : Colors.black,
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

                      trailing: GestureDetector(
                        onTap: () async {
                          await FirebaseFirestore.instance
                              .collection("cart")
                              .add({
                                'name': product.name,
                                'image': product.image,
                                'weight': product.weight,
                                'price': product.price,
                                'quantity': 1,
                              });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("${product.name} added to cart"),
                            ),
                          );
                        },
                        child: const CircleAvatar(
                          backgroundColor: Color(0xFF23AA49),
                          child: Icon(Icons.add, color: Colors.white),
                        ),
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
