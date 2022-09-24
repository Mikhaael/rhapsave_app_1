import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:rhapsave_app/presentation/core/dimens.dart';

class SelectPercentage extends StatelessWidget {
  final ValueChanged<int> onValueChanged;
  final int selected;

  const SelectPercentage(
      {super.key, required this.onValueChanged, required this.selected});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(10, (i) => (i + 1) * 10);
    return Column(
      children: items
          .slices(items.length ~/ 2)
          .map((row) => Padding(
                padding: const EdgeInsets.only(bottom: sSecondaryPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: row
                      .map(
                        (item) => _PercentageItem(
                          percent: item,
                          selected: selected == item,
                          onClick: onValueChanged,
                        ),
                      )
                      .toList(),
                ),
              ))
          .toList(),
    );
  }
}

class _PercentageItem extends StatelessWidget {
  final int percent;
  final bool selected;
  final ValueChanged<int> onClick;

  const _PercentageItem({
    super.key,
    required this.percent,
    required this.selected,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      splashColor: theme.colorScheme.primaryContainer,
      onTap: () => onClick(percent),
      child: Container(
        width: 65,
        padding: const EdgeInsets.symmetric(
          horizontal: sSecondaryPadding,
          vertical: sSecondaryPadding / 2,
        ),
        decoration: BoxDecoration(
          color: selected
              ? const Color.fromRGBO(254, 141, 1, 1)
              : const Color.fromRGBO(178, 179, 179, 0.2),
          borderRadius: BorderRadius.circular(sSecondaryPadding / 2),
        ),
        child: Text(
          '${percent.toString()}%',
          style: theme.textTheme.caption,
        ),
      ),
    );
  }
}
