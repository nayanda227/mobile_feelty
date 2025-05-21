import 'package:flutter/material.dart';
import 'package:uts_feelty/Login/components/forgotpass.dart';
import '../../../constants.dart';
import '../../workout.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              "Sign in",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: InputDecoration(
              labelText: "Email Address",
              hintText: "lanadee@gmail.com",
              labelStyle: const TextStyle(color: Colors.black),
              hintStyle: const TextStyle(color: Colors.grey),
              suffixIcon: const Icon(Icons.email_outlined, color: kPrimaryColor),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kPrimaryColor, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kPrimaryColor, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "*********",
                labelText: "Password",
                labelStyle: const TextStyle(color: Colors.black),
                hintStyle: const TextStyle(color: Colors.grey),
                suffixIcon: const Icon(Icons.remove_red_eye_outlined, color: kPrimaryColor),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kPrimaryColor, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kPrimaryColor, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: Row(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      activeColor: kPrimaryColor,
                      onChanged: (value) {
                      },
                    ),
                    const Text("Remember me"),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ForgotPassword();
                        },
                      )
                    );
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomePage();
                    },
                  )
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              elevation: 0,
              minimumSize: const Size(double.infinity, 50),
            ),
            child: Text(
              "Login".toUpperCase(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
