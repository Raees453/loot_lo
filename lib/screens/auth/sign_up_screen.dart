import 'package:flutter/material.dart';
import 'package:lootlo/screens/auth/login_screen.dart';

import '../../utils/constants/app_constants.dart';
import '../../widgets/custom_components/custom_button.dart';
import '../../widgets/custom_components/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = '/sign-up';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[280],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.horizontalPadding),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              const Text(
                'Create Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                'Let\'s Create Account together',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 80),
              const CustomTextField(
                hint: 'Email Address',
                type: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              const CustomTextField(
                hint: 'Password',
                obscureText: true,
                type: TextInputType.text,
              ),
              const SizedBox(height: 20),
              const CustomTextField(
                hint: 'Confirm Password',
                obscureText: true,
                type: TextInputType.text,
                action: TextInputAction.done,
              ),
              const SizedBox(height: 30),
              CustomButton(text: 'Sign Up', onPressed: () {}),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppConstants.borderRadius,
                    ),
                    side: BorderSide.none,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                    vertical: 12,
                  ),
                  textStyle: const TextStyle(
                    fontSize: AppConstants.buttonTextFontSize,
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/google_logo.png',
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'Sign in with Google',
                      style: TextStyle(
                        fontSize: AppConstants.buttonTextFontSize,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have any account?'),
                  TextButton(
                    onPressed: () => Navigator.of(context)
                        .pushReplacementNamed(LoginScreen.routeName),
                    child: const Text('Sign In'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
