import 'package:flutter/material.dart';
import '../../../data/model/saving.dart';
import '../../core/assets.dart';
import '../../core/dimens.dart';
import 'card.dart';
import 'modal.dart';

class CreateRhapsaveScreen extends StatelessWidget {
  const CreateRhapsaveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.appBackground),
              fit: BoxFit.cover,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        leading: const IconButton(
          onPressed: null,
          icon: Icon(
            Icons.keyboard_arrow_left_outlined,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Create Rhapsave",
          style: theme.textTheme.bodyText1,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _addRhapsave(context),
            icon: const Icon(
              Icons.add_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: testSavings.length,
          itemBuilder: (_, i) => RhapsaveSavingsCard(testSavings[i]),
          separatorBuilder: (_, __) => const SizedBox(
            height: sSecondaryPadding,
          ),
          padding: const EdgeInsets.all(sPadding),
        ),
      ),
    );
  }

  _addRhapsave(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (_) => const CreateRhapsaveModal(),
    );
  }
}
