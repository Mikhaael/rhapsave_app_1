import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhapsave_app/presentation/core/assets.dart';

import '../../../data/model/saving.dart';
import '../../core/dimens.dart';
import 'indicator.dart';

// final _amountFormatter = NumberFormat.simpleCurrency(
//   name: 'NGN',
//   locale: 'en_NG',
// );

final _amountFormatter = NumberFormat.currency(symbol: 'N', decimalDigits: 0);

class RhapsaveSavingsCard extends StatelessWidget {
  final RhapsaveSaving _saving;

  const RhapsaveSavingsCard(this._saving, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final random = Random();

    final colors = List.generate(
      _saving.savings.length,
      (_) => theme.colorScheme.primary.withAlpha(
        50 + random.nextInt(205),
      ),
    );
    final chartSections = List.generate(
      _saving.savings.length,
      (i) {
        final value = _saving.savings.values.elementAt(i).toDouble();
        return PieChartSectionData(
          color: colors[i],
          showTitle: false,
          value: value,
          radius: 22,
        );
      },
    );

    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(sSecondaryPadding / 2),
      ),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(sPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rhapsave Savings',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      // vSpace(sSecondaryPadding / 2),
                      Text(
                        _amountFormatter.format(_saving.amount),
                        style: GoogleFonts.poppins(
                          wordSpacing: 2,
                          fontSize: 28,
                          letterSpacing: 3,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Save automatically towards several goals.',
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  const FittedBox(
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: Image(
                        height: 12,
                        image: AssetImage(
                          Assets.pieChart,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              vSpace(sSecondaryPadding),
              Wrap(
                spacing: 3,
                alignment: WrapAlignment.spaceAround,
                children: _saving.savings.entries
                    .toList()
                    .asMap()
                    .entries
                    .map(
                      (e) => Indicator(
                        color: colors[e.key],
                        text: e.value.key,
                        size: 8,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
