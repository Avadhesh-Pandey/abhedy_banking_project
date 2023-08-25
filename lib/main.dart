import 'package:abhedy_banking_project/core/constants/color_constants.dart';
import 'package:abhedy_banking_project/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:abhedy_banking_project/core/di/injection_getit.dart' as di;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Init Dependency Inject
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Abhedy Banking',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColour),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

