import 'package:flutter/material.dart';

import '../core/dimens.dart';

class BottomBar extends StatelessWidget {
  final List<BottomBarItem> icons;
  final Function(int)? onClick;
  final int selectedIndex;

  const BottomBar({
    Key? key,
    required this.icons,
    this.onClick,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).padding.bottom +
            kBottomNavigationBarHeight +
            sPadding,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(sPadding),
            topRight: Radius.circular(sPadding),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: icons
              .asMap()
              .entries
              .map(
                (item) => _BottomBarItem(
                  data: item.value,
                  selected: selectedIndex == item.key,
                  onClick: () => onClick?.call(item.key),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class BottomBarItem {
  final IconData icon;
  final String title;

  const BottomBarItem(this.icon, this.title);
}

class _BottomBarItem extends StatelessWidget {
  final BottomBarItem data;
  final bool selected;
  final Function()? onClick;

  const _BottomBarItem({
    Key? key,
    required this.data,
    required this.selected,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: sSecondaryPadding,
          vertical: sSecondaryPadding / 2,
        ),
        decoration: BoxDecoration(
          color: selected
              ? theme.colorScheme.primaryContainer
              : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(
              data.icon,
              color: selected
                  ? theme.colorScheme.primary
                  : const Color(0xFFA7A7A7),
            ),
            if (selected) ...{
              hSpace(sSecondaryPadding / 2),
              Text(
                data.title,
                style: theme.textTheme.caption?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            }
          ],
        ),
      ),
    );
  }
}
