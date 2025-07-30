import 'package:flutter/material.dart';
import 'package:gtocery_app/main.dart';
import 'package:gtocery_app/theme_manager.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isLocationEnabled = true;
  bool isNotificationEnabled = false;
  final Locale _locale = const Locale('en');

  void _toggleLocation(bool value) {
    setState(() {
      isLocationEnabled = value;
    });
  }

  void _toggleNotification(bool value) {
    setState(() {
      isNotificationEnabled = value;
    });
  }

  void _showLanguageSelection() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("اختر اللغة"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text("العربية"),
            SizedBox(height: 10),
            Text("الإنجليزية"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("إغلاق"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isArabic = _locale.languageCode == 'ar';
    final themeManager = Provider.of<ThemeManager>(context);

    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, size: 16),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Settings'),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: [
            const SizedBox(height: 24),
            _sectionTitle('PROFILE'),
            _buildCustomSwitchTile(
              title: 'Push Notification',
              value: isNotificationEnabled,
              onChanged: _toggleNotification,
            ),
            _buildCustomSwitchTile(
              title: 'Location',
              value: isLocationEnabled,
              onChanged: _toggleLocation,
            ),

            SwitchListTile(
              title: const Text('Dark Mode'),
              value: themeManager.themeMode == ThemeMode.dark,
              onChanged: (value) {
                themeManager.toggleTheme(value);
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Language'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('English'),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward_ios, size: 14),
                ],
              ),
              onTap: _showLanguageSelection,
            ),
            const SizedBox(height: 24),
            _sectionTitle('OTHER'),
            const _SettingsItem(title: 'About Ticketis'),
            const _SettingsItem(title: 'Privacy Policy'),
            const _SettingsItem(title: 'Terms and Conditions'),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomSwitchTile({
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: Colors.green,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey.shade300,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.grey,
        letterSpacing: 1.5,
        fontSize: 12,
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final String title;

  const _SettingsItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      onTap: () {},
    );
  }
}
