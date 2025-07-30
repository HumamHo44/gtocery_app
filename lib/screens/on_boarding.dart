import 'package:flutter/material.dart';
import 'package:gtocery_app/screens/phone_input_screen.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: Image.asset("assets/images/2.jpg.png"),
        backgroundColor: Colors.white,
        actions: [Image.asset("assets/images/1.jpg.png")],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: ClipOval(
                child: Image.asset(
                  "assets/images/Group1.png",
                  width: 75,
                  height: 75,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "Get Your groceries",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Text(
              "delivered to your home",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            Text(
              "The best delivery app in town for",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.4),
              ),
            ),
            Text(
              "delivering your daily fresh groceries",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.4),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: 190,
              height: 53,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const PhoneInputScreen();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: const Text(
                    "Shop now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 82),
            SizedBox(
              width: double.infinity,

              child: Stack(
                children: [
                  Positioned(
                    child: SizedBox(
                      height: 460,
                      width: double.infinity,
                      child: Image.asset(
                        "assets/images/4.jpg.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    top: -1,
                    child: Container(
                      child: Image.asset("assets/images/2.jpg.png"),
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
