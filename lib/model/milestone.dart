import 'package:flutter/material.dart';

class Milestone {
  final Widget title;
  final Widget? prefixChild;
  final Widget? child;
  final Widget? icon;
  final bool isActive;
  Milestone(
      {required this.title,
      this.icon,
      this.child,
      this.prefixChild,
      this.isActive = true});
}
