import 'package:flutter/material.dart';

import 'example_one.dart';
import 'example_three.dart';
import 'example_two.dart';

class Examples extends StatelessWidget {
  const Examples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text("Examples"),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const ExampleOne()));
                    },
                    label: const Text("Available Slots")),
                const SizedBox(
                  height: 15,
                ),
                FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const ExampleTwo()));
                    },
                    label: const Text("Order Tracker")),
                const SizedBox(
                  height: 15,
                ),
                FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const ExampleThree()));
                    },
                    label: const Text("Weather Timeline")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
