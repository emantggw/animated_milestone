import 'package:animated_milestone/constants/numbers.dart';
import 'package:animated_milestone/model/milestone.dart';
import 'package:flutter/material.dart';

class MilestoneContentWidget extends StatelessWidget {
  final Milestone milestone;
  final bool greyoutContentWithInactive;
  const MilestoneContentWidget(
      {super.key,
      required this.milestone,
      required this.greyoutContentWithInactive});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MileNumbers.kdPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
              visible: milestone.isActive || !greyoutContentWithInactive,
              replacement: Opacity(
                opacity: MileNumbers.kdInactiveOpacity,
                child: milestone.title,
              ),
              child: milestone.title),
          const SizedBox(
            height: MileNumbers.kdSmallSpace,
          ),
          Visibility(
              visible: milestone.isActive || !greyoutContentWithInactive,
              replacement: Opacity(
                opacity: MileNumbers.kdInactiveOpacity,
                child: milestone.child ?? Container(),
              ),
              child: milestone.child ?? Container()),
        ],
      ),
    );
  }
}
