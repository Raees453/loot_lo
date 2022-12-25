import 'package:flutter/material.dart';
import 'package:lootlo/screens/home_screen.dart';
import 'package:lootlo/screens/sign_up_screen.dart';
import 'package:lootlo/utils/constants/app_constants.dart';
import 'package:lootlo/widgets/custom_components/custom_button.dart';
import 'package:lootlo/widgets/custom_components/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login-screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.horizontalPadding),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                const Text(
                  'Hello Again!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  'Welcome back, you\'ve been missed!',
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
                  action: TextInputAction.done,
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Forgot Password?'),
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                    text: 'Sign In',
                    onPressed: () => Navigator.of(context)
                        .pushReplacementNamed(HomeScreen.routeName)),
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
                    const Text('Don\'t have any account?'),
                    TextButton(
                      onPressed: () => Navigator.of(context)
                          .pushNamed(SignUpScreen.routeName),
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
