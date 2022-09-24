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

    return Column(
      children: [
        vSpace(sSecondaryPadding / 2),
        Container(
          width: 60,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(sSecondaryPadding / 2),
          ),
        ),
        ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(sPadding),
          children: [
            Text(
              'Awesome',
              style: sAwesomeTextStlye,
            ),
            vSpace(sSecondaryPadding / 2),
            Text(
              'What percentage of your income would you like to\nsave?',
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
            vSpace(sSecondaryPadding / 2),
            const SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: null,
                child: Text('Enter Manually'),
              ),
            ),
            vSpace(sSecondaryPadding / 2),
            primaryButton(
              text: 'Create Save',
              onPressed: () {},
              fillColor: const Color.fromRGBO(247, 79, 1, 1),
              textColor: Colors.white,
            )
          ],
        ),
      ],
    );
  }
}
