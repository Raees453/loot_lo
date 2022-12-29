import 'package:flutter/material.dart';

enum AppLanguage {
  english,
  urdu,
}

class AppLanguageDialogue extends StatefulWidget {
  AppLanguageDialogue({Key? key}) : super(key: key);

  @override
  State<AppLanguageDialogue> createState() => _AppLanguageDialogueState();
}

class _AppLanguageDialogueState extends State<AppLanguageDialogue> {
  AppLanguage language = AppLanguage.urdu;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Language / زبان'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile<AppLanguage>(
            contentPadding: EdgeInsets.zero,
            title: const Text('اردو'),
            value: AppLanguage.urdu,
            groupValue: language,
            onChanged: (value) {
              if (value != null) {
                setState(() => language = value);
                Navigator.of(context).pop();
              }
            },
          ),
          RadioListTile<AppLanguage>(
            contentPadding: EdgeInsets.zero,
            title: const Text('English'),
            value: AppLanguage.english,
            groupValue: language,
            onChanged: (value) {
              if (value != null) {
                setState(() => language = value);
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }
}
