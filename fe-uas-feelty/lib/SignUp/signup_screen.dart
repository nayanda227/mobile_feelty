import 'package:flutter/material.dart';
import '../Login/login_screen.dart';
import '../components/already_have_an_account_acheck.dart';
import 'components/signup_form.dart';
import 'components/or_divider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                return const MobileSignupScreen();
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 450,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SignUpForm(),
                          SizedBox(height: 20),
                          OrDivider(),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20), // Tambahkan jarak antar elemen
                    AlreadyHaveAnAccountCheck(
                      login: false,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const LoginScreen();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class MobileSignupScreen extends StatelessWidget {
  const MobileSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  SignUpForm(),
                  SizedBox(height: 20),
                  OrDivider(),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
        const SizedBox(height: 20),
        AlreadyHaveAnAccountCheck(
          login: false,
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const LoginScreen();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
