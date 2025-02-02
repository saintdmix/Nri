import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nriweb/klandingPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("this is the height ${MediaQuery.of(context).size.height}");
    print("this is the width ${MediaQuery.of(context).size.width}");

    return ScreenUtilInit(
        designSize: const Size(1366, 641),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: LandingPage());
        });
  }
}
