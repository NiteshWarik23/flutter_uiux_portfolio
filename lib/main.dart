import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/core/dependency_injection/dependency_injection.dart';
import 'package:my_portfolio/landing_page.dart';
import 'package:my_portfolio/core/dependency_injection/dependency_injection.dart'
    as di;
import 'package:my_portfolio/mobile_view.dart';
import 'package:my_portfolio/mobile_view_option1.dart';
import 'package:my_portfolio/modules/about_me/presentation/bloc/tabbar_bloc/tab_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application. the bloc and event is triggered properly
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nitesh Kishor Warik',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF0F766E), // Teal background
      ),
      home: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return const MobileViewOption1();
            //MobileView();
          } else if (constraints.maxWidth < 1200) {
            return const MobileView(); // Replace with your tablet view widget
          } else {
            final TabBarBloc tabBarBloc = locator<TabBarBloc>();
            return BlocProvider(
              create: (context) => tabBarBloc,
              child: LandingPage(),
            ); // Replace with your web view widget what are the top 5 ways that i can ask questions to you like the top 1 percent
          }
        },
      ),
    );
  }
}
