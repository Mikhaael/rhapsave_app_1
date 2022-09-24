import 'package:flutter/material.dart';
import '../../core/dimens.dart';
import 'header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const _items = [
    {
      'icon': Icons.security_outlined,
      'title': 'Security',
    },
    {
      'icon': Icons.credit_card_outlined,
      'title': 'Cards',
    },
    {
      'icon': Icons.notifications_outlined,
      'title': 'Notifications',
    },
    {
      'icon': Icons.support_agent,
      'title': 'Live Support',
    },
    {
      'icon': Icons.info_outline,
      'title': 'About Us',
    },
    {
      'icon': Icons.contact_phone_outlined,
      'title': 'Contact Us',
    },
    {
      'icon': Icons.credit_card_off_outlined,
      'title': 'Terms & Privacy Policy',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(0, 0),
        child: SizedBox(),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const ProfileHeader(),
          vSpace(sPadding),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: sPadding),
            child: Column(
              children: _items.map((item) => ProfileItem(item: item)).toList(),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final Map<String, Object> item;

  const ProfileItem({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF484848);
    final theme = Theme.of(context);
    final title = item['title'] as String;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(sSecondaryPadding / 2),
          ),
          child: ListTile(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(title),
                  duration: const Duration(milliseconds: 500),
                ),
              );
            },
            leading: Icon(
              item['icon'] as IconData,
              color: theme.colorScheme.primary,
            ),
            title: Text(
              title,
              style: theme.textTheme.bodyText2?.copyWith(
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
            trailing: const Icon(
              Icons.navigate_next_outlined,
              color: color,
            ),
          ),
        ),
        vSpace(sSecondaryPadding / 2),
      ],
    );
  }
}
