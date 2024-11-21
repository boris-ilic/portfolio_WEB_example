import 'dart:developer';

import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:boris_ilic_portfolio/global_components/buttons/section_button.dart';
import 'package:boris_ilic_portfolio/global_components/inputs/primary_input.dart';
import 'package:boris_ilic_portfolio/global_components/section_header.dart';
import 'package:boris_ilic_portfolio/helpers/responsive.dart';
import 'package:boris_ilic_portfolio/helpers/validators.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResponsiveContactContent extends StatelessWidget {
  final bool isLargeScreen;

  const ResponsiveContactContent({
    super.key,
    required this.isLargeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: ColorPalette.purple,
      padding: const EdgeInsets.symmetric(vertical: 40),
      child:
          isLargeScreen ? _buildLargeScreenLayout() : _buildSmallScreenLayout(),
    );
  }

  Widget _buildLargeScreenLayout() {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: ContactInfo()),
        Expanded(flex: 2, child: ResponsiveContactForm()),
      ],
    );
  }

  Widget _buildSmallScreenLayout() {
    return const Column(
      children: [
        ContactInfo(),
        SizedBox(height: 30),
        ResponsiveContactForm(),
      ],
    );
  }
}

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = ResponsiveWidget.isSmallScreen(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          subtitle: "Contact Us",
          titleWhite: "\nLet's ",
          titleGreen: "Connect &\nCollaborate",
          buttonLabel: "",
          onTap: null,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: isSmallScreen ? Sizes.size20 : Sizes.size60,
            bottom: Sizes.size10,
          ),
          child: const ClickableIconTextWidget(
            text: "+381 6436-52-091",
            icon: Icons.phone,
            contactType: ContactType.phone,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: isSmallScreen ? Sizes.size20 : Sizes.size60,
            bottom: Sizes.size10,
          ),
          child: const ClickableIconTextWidget(
            text: "ilicborisdev@gmail.com",
            icon: Icons.mail,
            contactType: ContactType.email,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: isSmallScreen ? Sizes.size20 : Sizes.size60,
          ),
          child: const ClickableIconTextWidget(
            text: "Vuka Karadzica 9a, Belgrade, Serbia",
            icon: Icons.pin_drop,
            contactType: ContactType.email,
          ),
        ),
      ],
    );
  }
}

class ClickableIconTextWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final ContactType contactType;

  const ClickableIconTextWidget({
    Key? key,
    required this.text,
    required this.icon,
    required this.contactType,
  }) : super(key: key);

  Future<void> _launchUrl() async {
    String urlString;
    switch (contactType) {
      case ContactType.phone:
        urlString = 'tel:${text.replaceAll(RegExp(r'[^\d+]'), '')}';
        log(urlString);
        break;
      case ContactType.email:
        urlString = 'mailto:$text';
        break;
      default:
        return;
    }

    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _launchUrl,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum ContactType {
  phone,
  email,
  location,
}

class ResponsiveContactForm extends StatefulWidget {
  const ResponsiveContactForm({super.key});

  @override
  State<ResponsiveContactForm> createState() => ResponsiveContactFormState();
}

class ResponsiveContactFormState extends State<ResponsiveContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  Future<void> _sendEmail() async {
    if (_formKey.currentState!.validate()) {
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'ilicborisdev@gmail.com',
        query: encodeQueryParameters(<String, String>{
          'subject': _subjectController.text,
          'body': '''
First Name: ${_firstNameController.text}
Last Name: ${_lastNameController.text}
Email: ${_emailController.text}
Subject: ${_subjectController.text}

Message:
${_messageController.text}
          ''',
        }),
      );

      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(emailLaunchUri);
        _formKey.currentState?.reset();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email client opened')),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not launch email client')),
          );
        }
      }
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = ResponsiveWidget.isSmallScreen(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final inputWidth = isSmallScreen
        ? screenWidth - 64 // Accounting for padding
        : (screenWidth * 0.3).clamp(280.0, 300.0);

    return Padding(
      padding: EdgeInsets.all(isSmallScreen ? Sizes.size8 : Sizes.size16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isSmallScreen) ...[
              _buildInput(_firstNameController, "First Name", inputWidth),
              _buildInput(_lastNameController, "Last Name", inputWidth),
              _buildInput(_emailController, "Email", inputWidth,
                  validator: Validators.validateEmail),
              _buildInput(_subjectController, "Subject", inputWidth),
            ] else ...[
              Row(
                children: [
                  _buildInput(_firstNameController, "First Name", inputWidth),
                  _buildInput(_lastNameController, "Last Name", inputWidth),
                ],
              ),
              Row(
                children: [
                  _buildInput(_emailController, "Email", inputWidth,
                      validator: Validators.validateEmail),
                  _buildInput(_subjectController, "Subject", inputWidth),
                ],
              ),
            ],
            Container(
              margin:
                  EdgeInsets.all(isSmallScreen ? Sizes.size8 : Sizes.size12),
              width: isSmallScreen ? inputWidth : inputWidth * 2 + 24,
              child: PrimaryInput(
                controller: _messageController,
                isNewUserField: true,
                validator: Validators.validateNotEmpty,
                labelText: "Message",
                isRequired: true,
                textColor: ColorPalette.white,
                isTextArea: true,
                hintText: "I am here, feel free to reach me at any time...",
                maxLines: 7,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: Sizes.size16,
                left: isSmallScreen ? Sizes.size8 : Sizes.size12,
              ),
              child: SectionButton(
                label: "Send Message",
                isBlack: false,
                onTap: _sendEmail,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(
    TextEditingController controller,
    String label,
    double width, {
    String? Function(String?)? validator,
  }) {
    final isSmallScreen = ResponsiveWidget.isSmallScreen(context);
    return Container(
      margin: EdgeInsets.all(isSmallScreen ? Sizes.size8 : Sizes.size12),
      width: width,
      child: PrimaryInput(
        controller: controller,
        isNewUserField: true,
        labelText: label,
        isRequired: true,
        textColor: ColorPalette.white,
        validator: validator ?? Validators.validateNotEmpty,
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
