import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

import 'package:flutter_boilerplate/theme/theme.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final settings = GetStorage();
  var userTextSize = 1.0;
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'.tr),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.language),
                title: Text('Language'.tr),
                value: Text('English'.tr),
              ),
              SettingsTile.switchTile(
                onToggle: (bool value) {
                  setState(() {
                    isDarkMode = value;
                    settings.write('isDarkMode', isDarkMode);
                  });
                  Get.changeTheme(isDarkMode ? darkMode : lightMode);
                },
                initialValue: settings.read('isDarkMode') ?? false,
                leading: Icon(Icons.dark_mode),
                title: Text('Dark Mode'.tr),
              ),
              SettingsTile(
                title: Text('Text Size'),
                leading: Icon(Icons.text_fields),
                trailing: Slider(
                  min: 0.5,
                  max: 2.0,
                  divisions: 3,
                  value: userTextSize,
                  onChanged: (newValue) {
                    setState(() {
                      userTextSize = newValue;
                    });
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
