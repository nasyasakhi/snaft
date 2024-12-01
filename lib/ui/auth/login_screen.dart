import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 50.0),
          child: Form(
            key: _formSignUpKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo Title 
                const Center(
                  child: Text(
                    'Snaft',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 50.0),

                // Title
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),

                // Subtitle
                const Text(
                  'Enter your emails and password',
                  style: TextStyle(
                    color: textColorSmall,
                  ),
                ),
                const SizedBox(height: 30.0),

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
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: textColorSmall),
                    border: UnderlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20.0),

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
                    border: const UnderlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),

                Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),

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
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(borderRadiusSizeMine),
                        ),
                      ),
                      child: const Text(
                        'Sign In',
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
                        style: TextStyle(color: textColorSmall),
                      ),
                      GestureDetector(
                        onTap: () {
                         Navigator.pushNamed(context, '/register');
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
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