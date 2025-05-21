import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const kPrimaryColor = Colors.deepOrange;

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Column(
        children: <Widget>[
          Row(
            children: [
              buildDivider(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Or sign up with",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              buildDivider(),
            ],
          ),
          const SizedBox(height: 10),
          // SSO Buttons in Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSsoButton(
                context,
                label: "Google",
                svgPath: 'assets/icons/google.svg',
                onPressed: () {},
              ),
              _buildSsoButton(
                context,
                label: "Facebook",
                svgPath: 'assets/icons/facebook.svg',
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return const Expanded(
      child: Divider(
        color: Colors.black,
        height: 1.5,
      ),
    );
  }

  Widget _buildSsoButton(
      BuildContext context, {
        required String label,
        required String svgPath,
        required VoidCallback onPressed,
      }) {
    return SizedBox(
      width: 150,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: kPrimaryColor, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgPath,
              width: 16,
              height: 16,
            ),
            const SizedBox(width: 8),
            Text(
              label.toUpperCase(),
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
