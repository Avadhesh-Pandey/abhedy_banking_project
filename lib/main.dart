import 'package:abhedy_banking_project/core/constants/color_constants.dart';
import 'package:abhedy_banking_project/core/router/app_routes.dart';
import 'package:abhedy_banking_project/features/data/datasource/graphql_client.dart';
import 'package:flutter/material.dart';
import 'package:abhedy_banking_project/core/di/injection_getit.dart' as di;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  // Init Dependency Inject
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 640),  minTextAdapt: true,  splitScreenMode: true);
    return GraphQLProvider(
      client: clientNotifier,
      child: MaterialApp.router(
        title: 'Abhedy Banking',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColour),
          useMaterial3: true,
          primarySwatch: Colors.blue,
          textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 30.sp)),
        ),
        routerConfig: router,
      ),
    );
  }
}

