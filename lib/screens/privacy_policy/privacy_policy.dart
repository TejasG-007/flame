import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PrivacyPolicy extends StatefulWidget {
  final String appName;
  const PrivacyPolicy({required this.appName, super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    final String todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 16),
                children: [
                  const TextSpan(
                    text: 'Privacy Policy\n\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
                    text: 'Last Updated: $todayDate\n\n',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text: '1. Introduction\n\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        'Welcome to Tejas-G Production ("we", "our", "us"). We are committed to protecting your privacy. This Privacy Policy explains how we collect, use, and share your personal information when you use our application ("${widget.appName}").\n\n',
                  ),
                  const TextSpan(
                    text: '2. Information We Collect\n\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text:
                        'We may collect and process the following types of information:\n\n',
                  ),
                  const TextSpan(
                    text: 'a. Personal Information:\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text: '- Name\n- Email address\n- Username\n- Password\n\n',
                  ),
                  const TextSpan(
                    text: 'b. Usage Data:\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text:
                        '- App usage patterns and analytics\n- Device information (e.g., device type, operating system)\n\n',
                  ),
                  const TextSpan(
                    text: '3. How We Use Your Information\n\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text:
                        'We use the collected information for various purposes, including:\n- To provide, operate, and maintain our App\n- To improve, personalize, and expand our App\n- To understand and analyze how you use our App\n- To develop new products, services, features, and functionality\n\nWe are not using any of the information which gets saved. All information is kept confidential and secure.\n\n',
                  ),
                  const TextSpan(
                    text: '4. Data Security\n\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text:
                        'We take reasonable measures to protect your information from unauthorized access, alteration, disclosure, or destruction. We implement security measures such as encryption and secure access controls to ensure the confidentiality of your data.\n\n',
                  ),
                  const TextSpan(
                    text: '5. Sharing Your Information\n\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text:
                        'We do not share your personal information with third parties, except in the following cases:\n- With your consent\n- To comply with legal obligations\n- To protect and defend our rights and property\n- To prevent or investigate possible wrongdoing in connection with the App\n\n',
                  ),
                  const TextSpan(
                    text: '6. Your Data Protection Rights\n\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text:
                        'Depending on your location, you may have the following rights regarding your personal information:\n- The right to access – You have the right to request copies of your personal data.\n- The right to rectification – You have the right to request that we correct any information you believe is inaccurate or complete information you believe.\n',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
