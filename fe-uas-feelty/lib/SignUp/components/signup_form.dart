import 'package:flutter/material.dart';
import '../../../constants.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
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
              "Registration",
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
                hintText: "Phone Number",
                labelText: "Phone Number",
                labelStyle: const TextStyle(color: Colors.black),
                hintStyle: const TextStyle(color: Colors.grey),
                suffixIcon: const Icon(Icons.phone_outlined, color: kPrimaryColor),
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
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "************",
                labelText: "Confirm Password",
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
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              elevation: 0,
              minimumSize: const Size(double.infinity, 50),
            ),
            child: Text(
              "Create Account".toUpperCase(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
