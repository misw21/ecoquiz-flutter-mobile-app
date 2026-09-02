import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/extenssions/sizes_box.dart';
import '../../../core/extenssions/sizes_utils_extensions.dart';
import '../../../localizations.dart';
import '../widgets/login_form.dart';
import '../widgets/logo_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: 8.all, // line 26
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                65.heightBox,
                const LogoWidget(),
                50.heightBox,
                Center(
                  child: Text(
                    localizations.loginScreen,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                75.heightBox,
                const LoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
