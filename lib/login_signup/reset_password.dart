import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import 'constants.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});
  static const routeName = '/reset-password';

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  bool isEmailValid(String email) {
    final RegExp regex = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  style: kTextFormFieldStyle(),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'E-mail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a Email';
                    } else if (!isEmailValid(value)) {
                      return 'Please enter a valid Email';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: () async {},
                child: Text(
                  'Submit',
                  style: GoogleFonts.courgette(
                    color: themeManager.themeMode == ThemeMode.light
                        ? Colors.black
                        : Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'If you need to reset your password, please follow the steps below:\n1. Enter your email address associated with your account.\n2. Check your email for a password reset link. Make sure to check your spam folder if you dont see it in your inbox.\n3. Click on the password reset link and follow the instructions to create a new password.\n4. Once you have created a new password, you should be able to log in to your account with your new password.',
                style: kLoginTermsAndPrivacyStyle(size),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
