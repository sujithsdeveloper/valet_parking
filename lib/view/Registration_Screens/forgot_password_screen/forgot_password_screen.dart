import 'package:flutter/material.dart';
import 'package:vallet_parking/utils/constants/color_constants.dart';
import 'package:vallet_parking/utils/functions/validations.dart';
import 'package:vallet_parking/widgets/global_widgets/textfeildWidget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Forgot Password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Reset Your Password',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorConstants.primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Enter your email address below to receive a password reset link.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextfeildWidget(
                      controller: _emailController,
                      label: 'Email',
                      validation: (p0) => Validations.validateEmail(p0),
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Login',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: ColorConstants.primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
