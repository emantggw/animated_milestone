// ignore_for_file: file_names

import 'package:animated_milestone/constants/colors.dart';
import 'package:animated_milestone/constants/numbers.dart';
import 'package:flutter/material.dart';

class ChipTileWidget extends StatelessWidget {
  final String text;
  final bool isActive;
  final Function(String) onTap;
  const ChipTileWidget(
      {super.key,
      required this.text,
      required this.isActive,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(text);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        margin: const EdgeInsets.all(MileNumbers.kdMargin),
        padding: const EdgeInsets.all(MileNumbers.kdPadding),
        decoration: BoxDecoration(
            // color: kcBlackish,
            color: isActive ? MileColors.kcPrimary : null,
            border: Border.all(color: MileColors.kcBlackish),
            borderRadius: BorderRadius.circular(MileNumbers.kdCardRadius)),
        child: Text(text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: MileColors.kcWhite)),
      ),
    );
  }
}
