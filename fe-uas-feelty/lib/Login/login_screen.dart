import 'package:flutter/material.dart';
import '../SignUp/signup_screen.dart';
import '../components/already_have_an_account_acheck.dart';
import 'components/login_form.dart';
import 'components/or_divider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                return const MobileLoginScreen();
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 450,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          LoginForm(),
                          SizedBox(height: 20),
                          OrDivider(),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    AlreadyHaveAnAccountCheck(
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const SignUpScreen();
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

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({super.key});

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
                  LoginForm(),
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
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SignUpScreen();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
