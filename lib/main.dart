import 'package:flutter/material.dart';
import 'package:my_portfolio/landing_page.dart';
import 'package:my_portfolio/core/dependency_injection/dependency_injection.dart'
    as di;
import 'package:my_portfolio/modules/snake_game/snake_main.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
        home: LandingPage()
        //SnakeGameScreen() 
        //TabBarOnFlutterWeb(),
        //const MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}
