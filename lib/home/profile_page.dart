import 'package:flutter/material.dart';
import 'package:gtocery_app/screens/settings_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.center,
            child: const Text(
              'Profile Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),

          const SizedBox(height: 10),
          const CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/images/profileslogo.png'),
          ),
          const SizedBox(height: 6),
          const Text(
            'Albert Stevano Bajefski',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Albertstevano@gmail.com',
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          const SizedBox(height: 10),
          Divider(thickness: 1, color: Colors.grey.shade300, height: 20),
          buildSectionCard('PROFILE', [
            buildMenuItem(Icons.person_outline, 'Personal Data'),
            buildMenuItem(
              Icons.settings_outlined,
              'Settings',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SettingsPage()),
                );
              },
            ),
            buildMenuItem(Icons.credit_card, 'Extra Card'),
          ]),
          const SizedBox(height: 10),
          buildSectionCard('SUPPORT', [
            buildMenuItem(Icons.help_outline, 'Help Center'),
            buildMenuItem(Icons.delete_outline, 'Request Account Deletion'),
            buildMenuItem(Icons.person_add_alt_1, 'Add another account'),
          ]),
          const SizedBox(height: 14),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: 50,
            child: OutlinedButton.icon(
              onPressed: () {
                // Sign out logic here
              },
              icon: const Icon(Icons.logout, color: Colors.redAccent),
              label: const Text(
                'Sign Out',
                style: TextStyle(fontSize: 15, color: Colors.redAccent),
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.redAccent),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget buildSectionCard(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            title,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Column(children: items),
        ),
      ],
    );
  }

  Widget buildMenuItem(IconData icon, String label, {VoidCallback? onTap}) {
    return ListTile(
      dense: true,
      leading: Icon(icon, color: Colors.black, size: 20),
      title: Text(label, style: const TextStyle(fontSize: 14)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      onTap: onTap,
    );
  }
}
