import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthconnect/model/new_styles.dart';
import 'package:healthconnect/pages/home/profile_page.dart';
import 'package:healthconnect/widgets/build_button.dart';
import 'package:healthconnect/widgets/input_decoration.dart';
import 'package:healthconnect/widgets/my_background.dart';

class AskAQuestion extends StatefulWidget {
  const AskAQuestion({super.key});

  @override
  State<AskAQuestion> createState() => _AskAQuestionState();
}

class _AskAQuestionState extends State<AskAQuestion> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController tagsController = TextEditingController();
  final GlobalKey<FormState> askAQuestionKeyState = GlobalKey<FormState>();
  late AutovalidateMode autoValidateMode;

  @override
  void initState() {
    autoValidateMode = AutovalidateMode.disabled;
    super.initState();
  }

  startValidate() {
    setState(() {
      autoValidateMode = AutovalidateMode.onUserInteraction;
    });
  }

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentScope = FocusScope.of(context);
    return MyBackground(
      child: Scaffold(
        appBar: pageAppBar(context),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            currentScope = FocusScope.of(context);
            if (currentScope.hasPrimaryFocus || currentScope.hasFocus) {
              currentScope.unfocus();
            }
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ask A Question',
                  style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).dividerColor),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      const SizedBox(height: 16),
                      _buildTitleField(context),
                      const SizedBox(height: 16),
                      _buildDescriptionField(),
                      const SizedBox(height: 16),
                      _buildTagsField(),
                      const SizedBox(height: 24),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: BuildButton(
                          onPressed: () {
                            currentScope = FocusScope.of(context);
                            if (currentScope.hasPrimaryFocus ||
                                currentScope.hasFocus) {
                              currentScope.unfocus();
                            }
                          },
                          buttonColor: Theme.of(context).primaryColor,
                          buttonTitle: 'Continue',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Title',
          style: GoogleFonts.roboto(
            color: Theme.of(context).dividerColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          "Be specific and imagine you're asking a question to another person.",
          style: GoogleFonts.roboto(
            color: Theme.of(context).dividerColor.withOpacity(0.8),
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: titleController,
          style: normalTextStyle(context),
          autovalidateMode: autoValidateMode,
          decoration: questionDecoration(
            "e.g. What's the best fruit to take in the morning?",
            context,
          ),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Title is required';
            }
            if (value.length < 10) {
              return 'Title is too short';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildDescriptionField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Body',
          style: GoogleFonts.roboto(
            color: Theme.of(context).dividerColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Include all the information someone would need to answer your question.',
          style: GoogleFonts.roboto(
            color: Theme.of(context).dividerColor.withOpacity(0.8),
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: bodyController,
          style: normalTextStyle(context),
          autovalidateMode: autoValidateMode,
          minLines: 4,
          maxLines: 6,
          decoration: questionDecoration(
            "",
            context,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Body is required';
            }
            if (value.length < 10) {
              return 'Body is too short';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildTagsField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tags',
          style: GoogleFonts.roboto(
            color: Theme.of(context).dividerColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Add up to 5 tags to describe what your question is about',
          style: GoogleFonts.roboto(
            color: Theme.of(context).dividerColor.withOpacity(0.8),
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: titleController,
          style: normalTextStyle(context),
          autovalidateMode: autoValidateMode,
          decoration: questionDecoration(
            "e.g. Treatment, Well-being, diet",
            context,
          ),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            return null;
          },
        ),
      ],
    );
  }

  AppBar pageAppBar(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
            icon: Icon(Icons.clear, color: Theme.of(context).dividerColor),
          )
        ]);
  }
}
