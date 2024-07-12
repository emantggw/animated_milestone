import 'package:animated_milestone/constants/colors.dart';
import 'package:animated_milestone/constants/numbers.dart';
import 'package:animated_milestone/model/milestone.dart';
import 'package:animated_milestone/widgets/circle_milestone_widget.dart';
import 'package:animated_milestone/widgets/milestone_content_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class MilestoneCardWidget extends StatefulWidget {
  final int index;
  final Widget? generalMilestonIcon;
  final Color color;
  final Color disabledColor;
  final double circleRadius;
  final Milestone milestone;
  final Milestone? nextMilestone;
  final double stickThickness;
  final Color stickColor;
  final bool activeWithStick;
  final Curve animationCurve;
  final Duration animationDuration;
  final int milestoneIntervalDurationInMillis;
  final bool isLast;
  final bool enableAnimation;
  final bool showLastStick;
  final bool greyoutContentWithInactive;

  const MilestoneCardWidget({
    super.key,
    required this.index,
    required this.circleRadius,
    required this.milestone,
    required this.color,
    required this.disabledColor,
    required this.stickColor,
    required this.stickThickness,
    required this.activeWithStick,
    required this.animationCurve,
    required this.animationDuration,
    required this.milestoneIntervalDurationInMillis,
    required this.enableAnimation,
    required this.showLastStick,
    required this.greyoutContentWithInactive,
    this.nextMilestone,
    this.isLast = false,
    this.generalMilestonIcon,
  });

  @override
  State<MilestoneCardWidget> createState() => _MilestoneCardWidgetState();
}

class _MilestoneCardWidgetState extends State<MilestoneCardWidget>
    with TickerProviderStateMixin {
  final GlobalKey _widgetKey = GlobalKey();
  final GlobalKey _prefixChildKey = GlobalKey();
  AnimationController? _animationController;
  Animation<double>? _animationValue;

  double _widgetHeight = 0;
  double _prefixChildHeight = 0;
  bool _isHidden = true;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _animationValue = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController!, curve: widget.animationCurve));
    _animationValue?.addListener(_animListener);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _widgetHeight =
          (_widgetKey.currentContext!.findRenderObject() as RenderBox)
              .size
              .height;
      _prefixChildHeight = widget.milestone.prefixChild == null
          ? 0
          : (_prefixChildKey.currentContext?.findRenderObject() as RenderBox)
              .size
              .height;

      _isHidden = false;
      if (widget.enableAnimation) {
        Future.delayed(
            Duration(
                milliseconds: (widget.index) *
                    widget.milestoneIntervalDurationInMillis), () {
          _animationController!.forward();
        });
      } else {
        _animationValue = Tween<double>(begin: 1, end: 0).animate(
            CurvedAnimation(
                parent: _animationController!, curve: widget.animationCurve));
      }

      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.stop();

    super.dispose();
  }

  _animListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_animationValue == null) {
      return Container();
    }
    return AnimatedBuilder(
      animation: _animationValue!,
      builder: (context, child) => Offstage(
        offstage: _isHidden,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._prefixChild(),
            Column(
              children: [
                Opacity(
                  opacity: _animationValue!.value,
                  child: _icon(),
                ),
                _stick()
              ],
            ),
            Opacity(
              opacity: _animationValue!.value,
              child: MilestoneContentWidget(
                key: _widgetKey,
                greyoutContentWithInactive: widget.greyoutContentWithInactive,
                milestone: widget.milestone,
              ),
            )
          ],
        ),
      ),
    );
  }

  _prefixChild() {
    if (widget.milestone.prefixChild != null) {
      return [
        Opacity(
          key: _prefixChildKey,
          opacity: _animationValue!.value,
          child: widget.milestone.prefixChild,
        ),
        const SizedBox(
          width: MileNumbers.kdSpace,
        ),
      ];
    }
    return [];
  }

  _icon() {
    if (widget.milestone.icon != null) {
      return ClipRRect(
          borderRadius: BorderRadius.circular(widget.circleRadius),
          child: widget.milestone.icon!);
    }
    if (widget.generalMilestonIcon != null) {
      return ClipRRect(
          borderRadius: BorderRadius.circular(widget.circleRadius),
          child: widget.generalMilestonIcon!);
    }
    return CircleMilestonWidget(
        color: widget.milestone.isActive && !_animationController!.isAnimating
            ? widget.color
            : widget.disabledColor,
        radius: widget.circleRadius);
  }

  _stick() {
    return Visibility(
        visible: !widget.isLast || widget.showLastStick,
        child: SizedBox(
          height: math.max(_widgetHeight, _prefixChildHeight) *
              _animationValue!.value,
          child: VerticalDivider(
            thickness: widget.stickThickness,
            color: !(widget.nextMilestone?.isActive ?? true) &&
                    widget.greyoutContentWithInactive
                ? MileColors.kcGrey
                : widget.milestone.isActive &&
                        widget.activeWithStick &&
                        !_animationController!.isAnimating
                    ? widget.color
                    : widget.stickColor,
          ),
        ));
  }
}
