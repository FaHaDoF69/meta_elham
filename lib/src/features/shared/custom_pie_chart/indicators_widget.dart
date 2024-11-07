import 'package:flutter/material.dart';

import '../../../data/models/shared/indicator_data_model.dart';
import 'indicator.dart';

class IndicatorsWidget extends StatelessWidget {
  final List<IndicatorDataModel> indicators;

  const IndicatorsWidget({
    super.key,
    required this.indicators,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35, bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: indicators
            .map(
              (indicator) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Indicator(
                  color: indicator.color,
                  text: indicator.text,
                  isSquare: true,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
