import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snaft/const.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                  'Sign Up',
                  style: textTitle
                ),
                const SizedBox(height: 10.0),
                                
                // Subtitle
                const Text(
                  'Enter your credentials to continue',
                  style: subMainTitle
                ),
                const SizedBox(height: 30.0),

                // Username Field
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: const TextStyle(color: Colors.grey),
                    enabledBorder: enabledUnderline,
                    focusedBorder: focusedUnderline,
                    errorBorder: errorUnderline
                  ),
                ),
                const SizedBox(height: defaultPadding),

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
                    labelStyle: const TextStyle(color: Colors.grey),
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
                    labelStyle: const TextStyle(color: Colors.grey),
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
                const SizedBox(height: defaultPadding / 2),

                // Terms and Policy
                const Text(
                  'By continuing you agree to our \nTerms of Service and Privacy Policy',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: textColorSmall, 
                    fontSize: 14.0
                  ),
                ),
                const SizedBox(height: 40.0),
 
                // Sign Up Button
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formSignUpKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Sign Up Successful'),
                            ),
                          );
                       Future.delayed(const Duration(seconds: 1), () {
                       Navigator.pushReplacementNamed(context, '/home');
                         });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(borderRadiusSizeMine),
                        ),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white
                          ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),

                // Already Have an Account?
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(
                          color: textColorSmall,
                          fontSize: 16
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                         Navigator.pushNamed(context, '/login');
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 16
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