import 'package:animated_milestone/model/milestone.dart';
import 'package:animated_milestone/view/milestone_timeline.dart';
import 'package:flutter/material.dart';

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  final List<Map<String, dynamic>> _orderActivities = [
    {
      "image": "assets/images/order_placed2.png",
      "title": "Order Placed",
      "description": "We have received your order.",
      "isActive": true,
    },
    {
      "image": "assets/images/order_confirmed.png",
      "title": "Order Confirmed",
      "description": "Your order has been confirmed.",
      "isActive": true,
    },
    {
      "image": "assets/images/order_processing.png",
      "title": "Order Processing",
      "description": "We are preparing your order.",
      "isActive": true,
    },
    {
      "image": "assets/images/order_ready_to_pickup.webp",
      "title": "Ready to Pickup",
      "description": "Your order is ready for pickup.",
      "isActive": false,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text(
              "Order Tracker",
              style: TextStyle(fontSize: 15),
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: MilestoneTimeline(
                color: Colors.lightGreen,
                circleRadius: 12,
                activeWithStick: true,
                stickThickness: 3,
                milestoneIntervalDurationInMillis: 300,
                milestones: _orderActivities
                    .map((activity) => Milestone(
                        isActive: activity["isActive"],
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              activity["image"],
                              width: 46,
                              height: 46,
                              // color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  activity["title"],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  activity["description"],
                                  style: const TextStyle(fontSize: 12),
                                )
                              ],
                            )
                          ],
                        )))
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
