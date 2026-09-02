import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/themes/theme_provider.dart';
import '../../l10n/language_provider.dart';
import '../../localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.settings),
      ),
      body: ListView(
        children: [
          // Dark Mode Toggle
          ListTile(
            leading: Icon(
              themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              color: themeProvider.isDarkMode ? Colors.amber : Colors.blue,
            ),
            title: Text(localizations.darkMode),
            trailing: Switch(
              value: themeProvider.isDarkMode,
              onChanged: themeProvider.toggleTheme,
              activeColor: Colors.blue,
            ),
          ),

          // Language Selection
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(localizations.language),
            trailing: DropdownButton<String>(
              value: languageProvider.isEnglish ? 'English' : 'Arabic',
              onChanged: (String? newValue) {
                if (newValue == 'English') {
                  languageProvider.setLocale(const Locale('en', ''));
                } else {
                  languageProvider.setLocale(const Locale('ar', ''));
                }
              },
              items: <String>['English', 'Arabic']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
