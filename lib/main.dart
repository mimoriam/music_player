import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

/// Models:

/// Screens:

/// Widgets:

/// Services:

/// State:
import 'package:provider/provider.dart';
import 'state/root_state.dart';
import 'state/theme_state.dart';

/// Utils/Helpers:
import 'package:beamer/beamer.dart';
import 'utils/app_routes.dart';
import 'package:device_preview/device_preview.dart';

/// Entry Point:
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => RootStateProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => ThemeStateProvider()),
      ],
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(),
      ),
      // child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final routerDelegate = BeamerDelegate(
    locationBuilder: appRoutes,
  );

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}
