import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';


import 'dashboard_page.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context,child)=> ResponsiveBreakpoints.builder(
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
          child: child!
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          return BouncingScrollWrapper.builder(
              context, buildPage(settings.name ?? ''),
              dragWithMouse: true);
        });
      },
      debugShowCheckedModeBanner: false,
    );
      /*debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF782076),
        textTheme: GoogleFonts.aBeeZeeTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: Color(0xFF40244B),
      ),
      home:  DashboardPage(),
    );*/
  }

  Widget buildPage(String name) {
    switch (name) {
      case '/': return const ResponsiveBreakpoints(breakpoints: [
        Breakpoint(start: 0, end: 480, name: MOBILE),
        Breakpoint(start: 481, end: 1200, name: TABLET),
        Breakpoint(start: 1201, end: double.infinity, name: DESKTOP),
      ], child: DashboardPage());
     /* case ListPage.name:
        return const ListPage();
      case PostPage.name:
      // Custom "per-page" breakpoints.
        return const ResponsiveBreakpoints(breakpoints: [
          Breakpoint(start: 0, end: 480, name: MOBILE),
          Breakpoint(start: 481, end: 1200, name: TABLET),
          Breakpoint(start: 1201, end: double.infinity, name: DESKTOP),
        ], child: PostPage());
      case TypographyPage.name:
        return const TypographyPage();*/
      default:
        return const SizedBox.shrink();
    }
  }
}


