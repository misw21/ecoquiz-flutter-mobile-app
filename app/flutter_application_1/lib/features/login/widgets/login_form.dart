import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/services/navigation_service.dart';
import '../../../l10n/language_provider.dart';
import '../../../localizations.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateUsername(String? value) {
    final localizations = AppLocalizations.of(context);
    if (value == null || value.isEmpty) {
      return localizations.validate;
    }
    if (value.length < 3) {
      return localizations.usernameValidation;
    }
    return null;
  }

  String? _validateEmail(String? value) {
    final localizations = AppLocalizations.of(context);
    if (value == null || value.isEmpty) {
      return localizations.validate;
    }

    // Using regex to validate email format
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return localizations.emailValidation;
    }
    return null;
  }

  String? _validatePassword(String? value) {
    final localizations = AppLocalizations.of(context);
    if (value == null || value.isEmpty) {
      return localizations.validate;
    }
    if (value.length < 6) {
      return localizations.passwordValidation;
    }
    return null;
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate a login process
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      if (!mounted) return;

      // Navigate to home screen
      NavigationService().pushReplacementNamed(AppRoute.homeScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final languageProvider = Provider.of<LanguageProvider>(context);

    // Set text direction based on language
    final textDirection = languageProvider.locale.languageCode == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr;

    return Directionality(
      textDirection: textDirection,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // Username field
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: localizations.username,
                hintText: localizations.enterUsername,
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: _validateUsername,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 20),

            // Email field
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: localizations.email,
                hintText: localizations.enterEmail,
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: _validateEmail,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 20),

            // Password field
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: localizations.password,
                hintText: localizations.enterPassword,
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              obscureText: _obscurePassword,
              validator: _validatePassword,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 30),

            // Login button with loading state
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _login,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(
                        localizations.login,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
