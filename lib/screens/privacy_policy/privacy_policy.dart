import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

final p_policy = '''
**Privacy Policy**

**Last Updated: [Date]**

**1. Introduction**

Welcome to TejasG Prod ("we", "our", "us"). We are committed to protecting your privacy. This Privacy Policy explains how we collect, use, and share your personal information when you use our ToDo app ("App").

**2. Information We Collect**

We may collect and process the following types of information:

**a. Personal Information:**
- Name
- Email address
- Username
- Password

**b. Usage Data:**
- Task entries and completion status
- App usage patterns and analytics
- Device information (e.g., device type, operating system)

**3. How We Use Your Information**

We use the collected information for various purposes, including:
- To provide, operate, and maintain our App
- To improve, personalize, and expand our App
- To understand and analyze how you use our App
- To develop new products, services, features, and functionality

We are not using any of the information which gets saved. All information is kept confidential and secure.

**4. Data Security**

We take reasonable measures to protect your information from unauthorized access, alteration, disclosure, or destruction. We implement security measures such as encryption and secure access controls to ensure the confidentiality of your data.

**5. Sharing Your Information**

We do not share your personal information with third parties, except in the following cases:
- With your consent
- To comply with legal obligations
- To protect and defend our rights and property
- To prevent or investigate possible wrongdoing in connection with the App

**6. Your Data Protection Rights**

Depending on your location, you may have the following rights regarding your personal information:
- The right to access – You have the right to request copies of your personal data.
- The right to rectification – You have the right to request that we correct any information you believe is inaccurate or complete information you believe.
''';

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        children: [
          Text(
            p_policy
          )
        ],
      ),
    );
  }
}
