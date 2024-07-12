import 'package:animated_milestone/constants/colors.dart';
import 'package:animated_milestone/model/milestone.dart';
import 'package:animated_milestone/widgets/milestone_card_widget.dart';
import 'package:flutter/material.dart';

class MilestoneTimeline extends StatefulWidget {
  final List<Milestone> milestones;
  final Color color;
  final Color disabledColor;
  final double circleRadius;
  final double stickThickness;
  final Color stickColor;
  final bool activeWithStick;
  final Widget? generalMilestoneIcon;
  final Curve animationCurve;
  final Duration animationDuration;
  final int milestoneIntervalDurationInMillis;
  final bool disableAnimation;
  final bool showLastStick;
  final bool greyoutContentWithInactive;

  MilestoneTimeline(
      {super.key,
      required this.milestones,
      this.color = MileColors.kcPrimary,
      this.disabledColor = MileColors.kcGrey,
      this.stickColor = MileColors.kcGrey,
      this.activeWithStick = false,
      this.disableAnimation = false,
      this.showLastStick = false,
      this.circleRadius = 8,
      this.stickThickness = 1,
      this.animationCurve = Curves.easeIn,
      this.animationDuration = const Duration(milliseconds: 500),
      this.milestoneIntervalDurationInMillis = 100,
      this.greyoutContentWithInactive = true,
      this.generalMilestoneIcon}) {
    assert(circleRadius >= 6, "Radius must be greater or equal to 6.");
    assert(circleRadius >= 0.5, "Thikness must be greater or equal to 0.5.");
    assert(milestoneIntervalDurationInMillis >= 0,
        "Milestone interval duration should greater or equal to 0 millis");
    assert(animationDuration.inMilliseconds >= 300,
        "General animation duration must be >= 300 millis");
  }

  @override
  State<MilestoneTimeline> createState() => _MilestoneTimelineState();
}

class _MilestoneTimelineState extends State<MilestoneTimeline> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List<Widget>.generate(
            widget.milestones.length,
            (index) => MilestoneCardWidget(
                index: index,
                activeWithStick: widget.activeWithStick,
                circleRadius: widget.circleRadius,
                color: widget.color,
                disabledColor: widget.disabledColor,
                milestone: widget.milestones[index],
                stickColor: widget.stickColor,
                stickThickness: widget.stickThickness,
                generalMilestonIcon: widget.generalMilestoneIcon,
                animationCurve: widget.animationCurve,
                animationDuration: widget.animationDuration,
                milestoneIntervalDurationInMillis:
                    widget.milestoneIntervalDurationInMillis,
                enableAnimation: !widget.disableAnimation,
                nextMilestone: index + 1 < widget.milestones.length
                    ? widget.milestones[index + 1]
                    : null,
                isLast: widget.milestones.length - 1 == index,
                greyoutContentWithInactive: widget.greyoutContentWithInactive,
                showLastStick: widget.showLastStick)));
  }
}
