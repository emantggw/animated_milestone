import 'package:animated_milestone/model/milestone.dart';
import 'package:animated_milestone/view/milestone_timeline.dart';
import 'package:flutter/material.dart';

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  final List<Map<String, dynamic>> _weatherData = [
    {
      "time": "06:00",
      "title": "Clear",
      "description":
          "15° C\nA cool and refreshing morning. Perfect time for a jog.",
      "icon": Icons.weekend,
    },
    {
      "time": "09:00",
      "title": "Sunny",
      "description":
          "22° C\nBright and sunny. A great time for outdoor activities. Wear sunscreen!",
      "icon": Icons.sunny
    },
    {
      "time": "12:00",
      "title": "Partly Cloudy",
      "description":
          "28° C\nWarm with a mix of sun and clouds. Ideal weather for a picnic.",
      "icon": Icons.cloud_outlined
    },
    {
      "time": "15:00",
      "title": "Rainy",
      "description":
          "24° C\nLight showers expected. Remember to carry an umbrella if you're stepping out.",
      "icon": Icons.cloudy_snowing
    },
    {
      "time": "18:00",
      "title": "Cloudy",
      "description":
          "26° C\nA beautiful afternoon to take a walk into the park. Don't forget to take your water.",
      "icon": Icons.cloud
    },
    {
      "time": "21:00",
      "title": "Thunderstorms",
      "description":
          "20° C\nStormy weather with possible thunderstorms. Best to stay indoors.",
      "icon": Icons.thunderstorm
    },
    {
      "time": "00:00",
      "title": "Clear",
      "description": "18° C\nA calm and clear night. Perfect for stargazing.",
      "icon": Icons.surfing_sharp
    },
    {
      "time": "03:00",
      "title": "Foggy",
      "description":
          "16° C\nVisibility is low due to fog. Drive carefully if you're traveling.",
      "icon": Icons.foggy
    },
    {
      "time": "12:00",
      "title": "Snowy",
      "description":
          "0° C\nSnowfall expected throughout the day. Dress warmly and be safe.",
      "icon": Icons.snowing
    },
    {
      "time": "18:00",
      "title": "Windy",
      "description":
          "22° C\nStrong winds blowing. Secure any loose items outside your home.",
      "icon": Icons.air
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/weather_night3.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width + 120,
            fit: BoxFit.cover,
          ),
          CustomScrollView(
            slivers: [
              const SliverAppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                backgroundColor: Colors.transparent,
                title: Text(
                  "Weather Timeline",
                  style: TextStyle(fontSize: 15),
                ),
                actions: [],
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .88,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SingleChildScrollView(
                      child: MilestoneTimeline(
                        stickColor: Colors.white,
                        circleRadius: 12,
                        stickThickness: 3,
                        milestones: _weatherData
                            .map((e) => Milestone(
                                prefixChild: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(e["time"]),
                                ),
                                icon: CircleAvatar(
                                  radius: 18,
                                  backgroundColor:
                                      Colors.white.withOpacity(0.85),
                                  child: Icon(
                                    e["icon"],
                                    color:
                                        const Color.fromARGB(254, 80, 83, 181),
                                  ),
                                ),
                                title: Text(
                                  e["title"],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Text(
                                    e["description"],
                                    maxLines: 3,
                                    style: const TextStyle(
                                        color: Colors.white70, fontSize: 12),
                                  ),
                                )))
                            .toList(),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
