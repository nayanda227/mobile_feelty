import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class SsoButtons extends StatelessWidget {
  const SsoButtons({super.key});

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: buildDivider()),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Or sign up with",
                style: TextStyle(
                  color: kPrimaryLightColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(child: buildDivider()),
          ],
        ),
        const SizedBox(height: 20),
        _buildSsoButton(
          context,
          label: "Continue with Google",
          svgPath: 'assets/icons/google.svg',
          onPressed: () { },
        ),
        const SizedBox(height: 20),
        _buildSsoButton(
          context,
          label: "Continue with Apple",
          svgPath: 'assets/icons/apple.svg',
          onPressed: () { },
        ),
        const SizedBox(height: 20),
        _buildSsoButton(
          context,
          label: "Continue with Facebook",
          svgPath: 'assets/icons/facebook.svg',
          onPressed: () { },
        ),
      ],
    );
  }

  Widget _buildSsoButton(BuildContext context,
      {required String label, required String svgPath, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: kPrimaryColor, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgPath,
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 12),
          Text(
            label.toUpperCase(),
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildDivider() {
    return const Divider(
      color: Colors.grey,
      thickness: 1,
    );
  }
}
