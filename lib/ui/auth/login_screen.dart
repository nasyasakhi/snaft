import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snaft/const.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formSignUpKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 120.0),
          child: Form(
            key: _formSignUpKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo Title 
                const Center(
                  child: Text(
                    'Snaft',
                    style: mainTitle
                  ),
                ),
                const SizedBox(height: 50.0),

                // Title
                Text(
                  'Sign In',
                  style: textTitle
                ),
                const SizedBox(height: defaultPadding / 2),

                // Subtitle
                const Text(
                  'Enter your emails and password',
                  style: subMainTitle
                ),
                const SizedBox(height: defaultPadding * 1.5),

                // Email Field
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!RegExp('@gmail.com').hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: textColorSmall),
                    enabledBorder: enabledUnderline,
                    focusedBorder: focusedUnderline,
                    errorBorder: errorUnderline
                  ),
                ),
                const SizedBox(height: defaultPadding),

                // Password Field
                TextFormField(
                  obscureText: !isPasswordVisible,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: textColorSmall),
                    enabledBorder: enabledUnderline,
                    focusedBorder: focusedUnderline,
                    errorBorder: errorUnderline,
                    suffixIcon: IconButton(
                      icon: SvgPicture.asset(
                        isPasswordVisible
                            ? 'assets/icons/fi-rr-eye.svg'
                            : 'assets/icons/fi-rr-eye-crossed.svg',
                        colorFilter: const ColorFilter.mode(textColorSmall, BlendMode.srcIn),
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 16
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding),

                // Sign Up Button
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formSignUpKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Sign In Successful'),
                            ),
                          );    
                       Future.delayed(const Duration(seconds: 1), () {
                       Navigator.pushReplacementNamed(context, '/home');
                         });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(borderRadiusSizeMine),
                        ),
                      ),
                      child: const Text(
                        'Sign In',
                        style: buttonBgText
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding * 2),

                // Already Have an Account?
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'No yet have account? ',
                        style: TextStyle(
                          color: textColorSmall,
                          fontSize: 16
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                         Navigator.pushNamed(context, '/register');
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}