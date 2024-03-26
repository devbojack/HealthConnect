import 'package:flutter/material.dart';
import 'package:healthconnect/widgets/my_background.dart';
import '../../provider/size_config.dart';
import '../../widgets/options_app_bar.dart';
import '../../widgets/text_icon_widgets.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  bool _isLoading = true;

  @override
  void initState() {
    _isLoading = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double mHeight = SizeConfig.blockSizeH!;
    return MyBackground(
      child: SafeArea(
        child: Scaffold(
          appBar: secAppBar('Privacy Policy', context),
          body: _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  physics: const BouncingScrollPhysics(),
                  child: terms(context),
                ),
        ),
      ),
    );
  }

  Widget terms(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // bigTermsBoldText('Privacy Policy', context),
          // const SizedBox(height: 24),
          normalTermsText(
              'At Health Connect, we are committed to protecting your privacy and ensuring the confidentiality of your personal information. This Privacy Policy outlines how we collect, use, disclose, and safeguard your information when you use our services or interact with our platform. By accessing or using Health Connect, you agree to the terms outlined in this Privacy Policy.',
              context),
          const SizedBox(height: 16),
          bigTermsBoldText('Information We Collect:', context),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              children: [
                defAndKeys(
                    "Personal Information: This may include your name, contact information, demographic details, and other identifiers necessary for providing our services."
                    , context),
                defAndKeys(
                  "Health Information: We may collect health-related information such as medical history, symptoms, treatments, and other health-related data you choose to share with us.", context),
                defAndKeys(
                    "Usage Data: We may gather information about how you interact with our platform, including device information, IP address, browser type, and usage patterns.",
                    context),
                defAndKeys(
                    "Usage Data: We may gather information about how you interact with our platform, including device information, IP address, browser type, and usage patterns.",
                    context),
              ],
            ),
          ),
          const SizedBox(height: 16),
          bigTermsBoldText("How We Use Your Information", context),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              children: [
                defAndKeys(
                    "Providing Services: To deliver and personalize our services, respond to your inquiries, and fulfill your requests."
                    , context),
                defAndKeys(
                  "Improving Services: To analyze usage patterns, diagnose technical issues, and enhance the functionality and performance of Health Connect."
                  , context),
                defAndKeys(
                   "Communication: To communicate with you about updates, promotions, and other relevant information related to our services.",
                    context),
                defAndKeys(
                    "Legal Compliance: To comply with legal obligations, resolve disputes, and enforce our policies."
                    , context),
              ],
            ),
          ),
           const SizedBox(height: 16),
          bigTermsBoldText("Information Sharing:", context),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              children: [
                defAndKeys(
                   "Service Providers: We may share your information with trusted third-party service providers who assist us in delivering our services."
                    , context),
                defAndKeys(
                  "Legal Compliance: We may disclose information when required by law, court order, or legal process."
                  , context),
                defAndKeys(
                   "Business Transfers: In the event of a merger, acquisition, or sale of assets, your information may be transferred to the acquiring entity."
                   , context),
              ],
            ),
          ),
          const SizedBox(height: 16),
          bigTermsBoldText('Data Security', context),
          normalTermsText(
              "We implement security measures to protect your information from unauthorized access, disclosure, alteration, or destruction. However, please be aware that no method of transmission over the internet or electronic storage is 100% secure, and we cannot guarantee absolute security."
              , context),
          const SizedBox(height: 16),
          bigTermsBoldText('Your Choices', context),
          normalTermsText(
              "You have the right to access, update, or delete your personal information. You may also choose to opt-out of certain communications or data collection practices. However, please note that opting out may impact your ability to access certain features or services."
              , context),
          const SizedBox(height: 16),
          bigTermsBoldText("Children's Privacy:", context),
          normalTermsText(
              "Health Connect is not intended for use by individuals under the age of 18. We do not knowingly collect personal information from children under 18. If you are a parent or guardian and believe that your child has provided us with personal information, please contact us, and we will take appropriate action."
              ,context),
          const SizedBox(height: 16),
          bigTermsBoldText("Changes to this Privacy Policy", context),
          normalTermsText(
              "We reserve the right to update or modify this Privacy Policy at any time. We will notify you of any changes by posting the revised Privacy Policy on our website. Your continued use of Health Connect after the effective date of the revised Privacy Policy constitutes acceptance of the changes.",
              context),
          const SizedBox(height: 16),
          bigTermsBoldText('Your Consent', context),
          normalTermsText(
              "We've updated our Privacy Policy to provide you with complete transparency into what is being set when you visit our site/app and how it's being used. By using HealthConnect, registering an account, or making a purchase, you hereby consent to our Privacy Policy and agree to its terms.",
              context),
          const SizedBox(height: 16),
          bigTermsBoldText("Third-Party Services", context),
          normalTermsText(
              "We may display, include or make available third-party content (including data, information, applications and other products services) or provide links to third-party websites or services (Third- Party Services)."
              "You acknowledge and agree that Sure Bets shall not be responsible for any Third-Party Services, including their accuracy, completeness, timeliness, validity, copyright compliance, legality, decency, quality or any other aspect thereof. Sure Bets does not assume and shall not have any liability or responsibility to you or any other person or entity for any Third-Party Services."
              "Third-Party Services and links thereto are provided solely as a convenience to you and you access and use them entirely at your own risk and subject to such third parties' terms and conditions",
              context),
          const SizedBox(height: 16),
          bigTermsBoldText('Contact Us', context),
          normalTermsText(
              "Don't hesitate to contact us if you have any questions via the Contact Us page",
              context)
        ],
      ),
    );
  }

  Widget defAndKeys(String text, BuildContext context) => Container(
    margin: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            normalTermsText('\u2022', context),
            const SizedBox(width: 8),
            Flexible(
                fit: FlexFit.loose,
                child: normalTermsText(text, context)),
          ],
        ),
  );
}
