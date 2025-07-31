import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  final String title;
  final String price;
  final String weight;
  final String imagePath;

  const ProductView({
    super.key,
    required this.title,
    required this.price,
    required this.imagePath,
    required this.weight,
  });

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.28 + 30,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color(0xFFF3F5F7),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(120),
                    bottomRight: Radius.circular(120),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16,
                    bottom: 36,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      widget.imagePath,
                      fit: BoxFit.contain,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                    tooltip: 'رجوع',
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '1kg - ${widget.price}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFF324B),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        _quantityButton(Icons.remove, () {
                          if (quantity > 1) setState(() => quantity--);
                        }),
                        const SizedBox(width: 8),
                        Text(
                          '$quantity',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        _quantityButton(
                          Icons.add,
                          () => setState(() => quantity++),
                          isAdd: true,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'A fresh and diverse fruit salad made from seasonal fruits.\n'
                    'Flavored with honey and lemon for a sweet and tangy taste.\n'
                    'Served with a sprinkle of roasted nuts.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.4,
                      color: Color(0xFF979899),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 3.3,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _infoCard(Icons.eco, '100%', 'Organic', Colors.green),
                  _infoCard(
                    Icons.calendar_today,
                    '1 Year',
                    'Expiration',
                    Colors.blue,
                  ),
                  _infoCard(Icons.star, '4.8 (268)', 'Reviews', Colors.orange),
                  _infoCard(
                    Icons.local_fire_department,
                    '80 kcal',
                    '100 Gram',
                    Colors.red,
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () async {
                  await FirebaseFirestore.instance.collection("cart").add({
                    'name': widget.title,
                    'image': widget.imagePath,
                    'weight': widget.weight,
                    'price': widget.price,
                    'quantity': quantity,
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${widget.title} added to cart")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF23AA49),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: const Text(
                  'Add to cart',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _quantityButton(
    IconData icon,
    VoidCallback onPressed, {
    bool isAdd = false,
  }) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: isAdd ? const Color(0xFF23AA49) : Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: isAdd ? Colors.transparent : Colors.grey.shade300,
        ),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, color: isAdd ? Colors.white : Colors.black, size: 16),
        onPressed: onPressed,
      ),
    );
  }

  Widget _infoCard(
    IconData icon,
    String title,
    String subtitle,
    Color iconColor,
  ) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 28),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF23AA49),
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF979899),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
