import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:healthconnect/identifications/secret_ids.dart';
import 'package:healthconnect/model/new_styles.dart';
import 'package:healthconnect/widgets/build_button.dart';
import 'package:overlay_support/overlay_support.dart';
import '../../provider/size_config.dart';
import '../../widgets/input_decoration.dart';
import '../../widgets/my_background.dart';
import '../../widgets/options_app_bar.dart';
import 'package:http/http.dart' as http;

import '../../widgets/text_icon_widgets.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  String userEmail = '';
  String userSubject = '';
  String userMessage = '';
  final GlobalKey<FormState> contactUsKey = GlobalKey<FormState>();
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _userSubjectController = TextEditingController();
  final TextEditingController _userMessageController = TextEditingController();
  late AutovalidateMode myAutoValidate;

  @override
  void initState() {
    myAutoValidate = AutovalidateMode.disabled;
    super.initState();
  }

  @override
  void dispose() {
    userEmail = '';
    userSubject = '';
    userMessage = '';
    _userEmailController.dispose();
    _userMessageController.dispose();
    _userSubjectController.dispose();
    super.dispose();
  }

  enableAutoValidate() {
    setState(() {
      myAutoValidate = AutovalidateMode.onUserInteraction;
    });
  }

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentScope = FocusScope.of(context);
    SizeConfig().init(context);
    double mHeight = SizeConfig.blockSizeH!;
    double mWidth = SizeConfig.blockSizeW!;
    return MyBackground(
      child: SafeArea(
        maintainBottomViewPadding: true,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            currentScope = FocusScope.of(context);
            if (currentScope.hasPrimaryFocus || currentScope.hasFocus) {
              currentScope.unfocus();
            }
          },
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: secAppBar('Contact us', context),
            body: ListView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              padding: EdgeInsets.symmetric(
                  horizontal: mWidth * 5, vertical: mHeight * 2),
              children: [
                Align(
                  alignment: Alignment.center,
                  child: bigCenteredText(
                      'HealthConnect Support is ready to help you, 24 hours a day, 7 days a week.',
                      context),
                ),
                const SizedBox(height: 32),
                Form(
                  key: contactUsKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //_________________________________________________________________User email text form field
                      TextFormField(
                        controller: _userEmailController,
                        style: normalTextStyle(context),
                        autovalidateMode: myAutoValidate,
                        decoration: inputDecoration(
                            'Enter your email address', context),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (!EmailValidator.validate(value!)) {
                            return 'Please enter a valid email';
                          } else {
                            null;
                          }
                        },
                      ),
                      const SizedBox(height: 16),

                      //_________________________________________________________________User email text form field
                      TextFormField(
                        controller: _userSubjectController,
                        style: normalTextStyle(context),
                        autovalidateMode: myAutoValidate,
                        decoration:
                            inputDecoration('Type your subject here.', context),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a subject';
                          } else {
                            null;
                          }
                          return null;
                        },
                      ),

                      //_________________________________________________________________Message text form field
                      const SizedBox(height: 24),
                      TextFormField(
                        maxLines: 10,
                        minLines: 7,
                        autovalidateMode: myAutoValidate,
                        controller: _userMessageController,
                        style: normalTextStyle(context),
                        // expands: true,
                        decoration:
                            inputDecoration('Type your message here', context),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a message';
                          } else if (value.length <= 10) {
                            return 'Please expand your message';
                          } else {
                            null;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: mHeight * 5),
                      BuildSmallRoundButton(
                        onPressed: sendMessage,
                        buttonColor:
                            Theme.of(context).dividerColor.withOpacity(0.8),
                        buttonTitle: 'Continue',
                        titleColor: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      const SizedBox(height: 56),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///___________________________________________________________________________Send Message
  sendMessage() async {
    enableAutoValidate();
    contactUsKey.currentState!.save();
    var isValid = contactUsKey.currentState!.validate();
    if (!isValid) return;
    String userEmail = _userEmailController.text.trim();
    String userSubject = _userSubjectController.text.trim();
    String userMessage = _userMessageController.text.trim();
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ));
    try {
      await sendEmail(
          email: userEmail, subject: userSubject, message: userMessage);
      showSimpleNotification(
          const Text(
            'message sent successfully',
            style: TextStyle(fontSize: 11),
          ),
          foreground: Colors.white,
          slideDismiss: true,
          leading: const Icon(Icons.check_outlined),
          background: Colors.green);
      if (context.mounted) Navigator.of(context).pop();
    } catch (e) {
      showSimpleNotification(
          const Text(
            'Error sending message',
            style: TextStyle(fontSize: 11),
          ),
          leading: const Icon(
            Icons.warning_amber_rounded,
          ),
          slideDismiss: true,
          foreground: Colors.white,
          background: Colors.red);
    }
    if (context.mounted) Navigator.of(context).pop();
  }

  ///___________________________________________________________________________Send Email Future
  Future sendEmail(
      {required String email,
      required String subject,
      required String message}) async {
    const serviceId = ContactUsIds.serviceId;
    const templateId = ContactUsIds.templateId;
    const userId = ContactUsIds.userId;
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    final response = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_email': email,
            'user_subject': subject,
            'user_message': message,
          }
        }));
  }
}
