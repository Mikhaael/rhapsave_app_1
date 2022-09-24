import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhapsave_app/presentation/core/buttons.dart';
import 'package:rhapsave_app/presentation/core/styles.dart';

import '../../core/dimens.dart';
import 'percentage.dart';

class CreateRhapsaveModal extends StatefulWidget {
  const CreateRhapsaveModal({super.key});

  @override
  State<CreateRhapsaveModal> createState() => _CreateRhapsaveModalState();
}

class _CreateRhapsaveModalState extends State<CreateRhapsaveModal> {
  var _percent = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(sPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Awesome',
            style: sAwesomeTextStlye,
          ),
          Text(
            'What percentage of your income would you like to save?',
            style: sAwesomeTextStyle2,
          ),
          vSpace(sSecondaryPadding / 2),
          SelectPercentage(
            selected: _percent,
            onValueChanged: (value) {
              setState(() {
                _percent = value;
              });
            },
          ),
          const SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: null,
              child: Text('Enter Manually'),
            ),
          ),
          vSpace(sSecondaryPadding / 2),
          primaryButton(
            text: 'Create Rhapsave',
            onPressed: () {},
            fillColor: const Color.fromRGBO(247, 79, 1, 1),
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
