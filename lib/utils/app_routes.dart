import 'package:flutter/material.dart';

/// Models:

/// Screens:
import '../screens/home/home_screen.dart';

/// Widgets:

/// Services:

/// State:

/// Utils/Helpers:
import 'package:beamer/beamer.dart';

/// Entry Point:
final appRoutes = SimpleLocationBuilder(
  routes: {
    '/': (context, state) => BeamPage(
          key: const ValueKey('Home'),
          child: const HomeScreen(),
        ),
  },
);
