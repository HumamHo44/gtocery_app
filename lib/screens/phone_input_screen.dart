import 'package:flutter/material.dart';
import 'package:gtocery_app/home/home_page.dart';

class PhoneInputScreen extends StatefulWidget {
  const PhoneInputScreen({super.key});

  @override
  State<PhoneInputScreen> createState() => _PhoneInputScreenState();
}

class _PhoneInputScreenState extends State<PhoneInputScreen> {
  String phoneNumber = "";

  void addDigit(String digit) {
    if (phoneNumber.length < 10) {
      setState(() {
        phoneNumber += digit;
      });
    }
  }

  void deleteDigit() {
    if (phoneNumber.isNotEmpty) {
      setState(() {
        phoneNumber = phoneNumber.substring(0, phoneNumber.length - 1);
      });
    }
  }

  String formatPhoneNumber(String input) {
    final buffer = StringBuffer();
    for (int i = 0; i < input.length; i++) {
      if (i == 0) buffer.write('(');
      if (i == 3) buffer.write(') ');
      if (i == 6) buffer.write('-');
      if (i == 8) buffer.write('-');
      buffer.write(input[i]);
    }
    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    final formattedNumber = formatPhoneNumber(phoneNumber);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 40), // تنزيل المحتوى للأسفل
            child: Column(
              children: [
                const SizedBox(height: 12),

                // الأيقونة في المنتصف
                const CircleAvatar(
                  backgroundColor: Color(0xFFE7F4E8),
                  radius: 32,
                  child: Icon(Icons.eco_rounded, color: Colors.green, size: 30),
                ),

                const SizedBox(height: 24),

                // العنوان
                const Text(
                  'Enter your mobile number',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 8),

                // الوصف
                const Text(
                  'We will send you a verification code',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 24),

                // رقم الهاتف بصيغة منسقة
                Text(
                  '+44 | ${formattedNumber.padRight(16, '_')}',
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black38,
                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 24),

                // زر "Continue"
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const HomePage();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(300, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),

                const SizedBox(height: 12),

                // الشروط
                const Text.rich(
                  TextSpan(
                    text:
                        'By clicking on “Continue” you are agreeing\n to our ',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                    children: [
                      TextSpan(
                        text: 'terms of use',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 24),

                // لوحة الأرقام
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 12,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 2,
                        ),
                    itemBuilder: (context, index) {
                      if (index < 9) {
                        return numberButton('${index + 1}');
                      } else if (index == 9) {
                        return const SizedBox();
                      } else if (index == 10) {
                        return numberButton('0');
                      } else {
                        return IconButton(
                          icon: const Icon(Icons.backspace_outlined),
                          onPressed: deleteDigit,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget numberButton(String digit) {
    return ElevatedButton(
      onPressed: () => addDigit(digit),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: const Color(0xFFF1F2F6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(digit, style: const TextStyle(fontSize: 22)),
    );
  }
}
