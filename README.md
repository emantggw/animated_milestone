# AnimatedMilestone

AnimatedMilestone is a lightweight and customizable Flutter package that allows users to easily create milestone/timeline-related use-cases.

## Features

- **Customizable Animation**: Easily adjust animations to suit your needs.
- **Versatile Alignment**: Align milestones with different use cases.
- **Minimalistic Design**: Simple and clean design for easy integration.

## Screenshots

<p float="left">
  <img src="https://github.com/emantggw/animated_milestone/raw/main/assets/screenshots/example_three_screenshot.gif" width="300" />
  <img src="https://github.com/emantggw/animated_milestone/raw/main/assets/screenshots/example_two_screenshot.gif" width="300" />
  <img src="https://github.com/emantggw/animated_milestone/raw/main/assets/screenshots/example_one_screenshot.gif" width="300" />
</p>

## Getting Started

To start using AnimatedMilestone, add the dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  animated_milestone:
```

## Usage

[Example](https://github.com/emantggw/animated_milestone/blob/master/example/example_one.dart)
To use this package :

- add the dependency to your [pubspec.yaml](https://github.com/emantggw/animated_milestone/blob/master/pubspec.yaml) file.

yaml
dependencies:
flutter:
sdk: flutter
animated_milestone:

### How to use

```dart
MilestoneTimeline(
        color: Colors.lightGreen,
        circleRadius: 12,
        activeWithStick: true,
        stickThickness: 3,
        milestoneIntervalDurationInMillis: 300,
        milestones: [
          Milestone(
              title: const Text("Order Placed",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              child: const Text("We have received your order.",
                  style: TextStyle(fontSize: 12))),
          //...other timelines
        ]);
```

## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).

## Contact me

Get me on Telegram [@emantggw](https://t.me/emantggw)

# License

Copyright (c) 2024 Amanuel Tito

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
