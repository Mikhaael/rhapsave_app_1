import 'package:boxy/boxy.dart';
import 'package:flutter/material.dart';

import '../../core/assets.dart';
import '../../core/dimens.dart';
import '../../widgets/user_card.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomBoxy(
      delegate: _ProfileHeaderDelegate(),
      children: [
        BoxyId(
          id: #background,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  Assets.appBackground,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(sPadding),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipOval(
                        child: Material(
                          color: Colors.white,
                          child: InkWell(
                            splashColor: theme.colorScheme.primary,
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.all(
                                sSecondaryPadding / 2,
                              ),
                              child: Icon(Icons.menu_outlined),
                            ),
                          ),
                        ),
                      ),
                      ClipOval(
                        child: Material(
                          color: Colors.white,
                          child: InkWell(
                            splashColor: theme.colorScheme.primary,
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.all(
                                sSecondaryPadding / 2,
                              ),
                              child: Icon(Icons.notifications_outlined),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const BoxyId(
          id: #userCard,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: sPadding),
            child: UserCard(
              name: 'Abiola Ogunjobi',
              isVerified: true,
            ),
          ),
        ),
      ],
    );
  }
}

class _ProfileHeaderDelegate extends BoxyDelegate {
  @override
  Size layout() {
    final userCard = getChild(#userCard);
    final background = getChild(#background);

    final userCardSize = userCard.layout(constraints);
    final backgroundSize = background.layout(
      constraints.copyWith(maxHeight: userCardSize.height * 1.5),
    );

    background.position(Offset.zero);
    userCard.position(
      Offset(0, backgroundSize.height - userCardSize.height / 2),
    );

    return Size(
      backgroundSize.width,
      backgroundSize.height + userCardSize.height / 2,
    );
  }
}
