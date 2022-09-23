import 'package:flutter/material.dart';
import 'package:rhapsave_app/presentation/core/dimens.dart';

import 'user_image.dart';

class UserCard extends StatelessWidget {
  final String name;
  final bool isVerified;

  const UserCard({super.key, required this.name, this.isVerified = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(sSecondaryPadding),
        color: Colors.white,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: sSecondaryPadding,
          vertical: sPadding,
        ),
        leading: const SizedBox(
          width: 80,
          child: FittedBox(
            fit: BoxFit.cover,
            child: UserImage(),
          ),
        ),
        title: Row(children: [
          Text(
            name,
            style: theme.textTheme.headline6?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          if (isVerified) ...{
            hSpace(sSecondaryPadding / 2),
            Icon(
              Icons.verified_outlined,
              color: theme.colorScheme.primary,
            )
          }
        ]),
        subtitle: isVerified
            ? Text(
                'Verified',
                style: theme.textTheme.bodyText2?.copyWith(
                  color: const Color(0xFFB2B3B3),
                ),
              )
            : null,
      ),
    );
  }
}
