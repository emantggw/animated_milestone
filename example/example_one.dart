import 'package:animated_milestone/model/milestone.dart';
import 'package:animated_milestone/view/milestone_timeline.dart';
import 'package:flutter/material.dart';

import 'widgets/ChipTileWidget.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  final Map<String, dynamic> _availableSlots = {
    "morning": ["08:00 AM", "09:00 AM", "11:20 AM"],
    "afternoon": ["02:10 PM", "03:00 PM", "04:00 PM", "06:00 PM", "08:00 PM"]
  };

  String _selectedTime = "";

  _onTapTime(String tm) {
    _selectedTime = tm;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text(
              "Available Slots",
              style: TextStyle(fontSize: 15),
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: MilestoneTimeline(
                showLastStick: true,
                milestoneIntervalDurationInMillis: 600,
                activeWithStick: true,
                greyoutContentWithInactive: false,
                milestones: [
                  Milestone(
                      isActive:
                          _availableSlots["morning"].contains(_selectedTime),
                      title: const Text(
                        "Morning",
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Wrap(
                          children: List<Widget>.from(_availableSlots["morning"]
                              .map((time) => ChipTileWidget(
                                  text: time,
                                  onTap: _onTapTime,
                                  isActive: _selectedTime == time))),
                        ),
                      )),
                  Milestone(
                      isActive:
                          _availableSlots["afternoon"].contains(_selectedTime),
                      title: const Text(
                        "Afternoon",
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Wrap(
                          children: List<Widget>.from(
                              _availableSlots["afternoon"].map((time) =>
                                  ChipTileWidget(
                                      text: time,
                                      onTap: _onTapTime,
                                      isActive: _selectedTime == time))),
                        ),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
