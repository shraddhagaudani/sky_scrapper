
import 'package:demo/controllers/providers/connectivity_provider.dart';
import 'package:demo/controllers/providers/themeprovider.dart';
import 'package:demo/views/screens/detailspage.dart';
import 'package:demo/views/screens/homepage.dart';
import 'package:demo/views/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeAccessProvider(),
        ),
        ChangeNotifierProvider(create: (context) => ConnectivityProvider(),),
      ],
      builder: (context, _) {
        return MaterialApp(
          initialRoute: 'Splashscreen',
          theme: ThemeData.light(
            useMaterial3: true,
          ),
          darkTheme: ThemeData.dark(
            useMaterial3: true,
          ),
          themeMode: (Provider.of<ThemeAccessProvider>(context)
                      .themeModelAccess
                      .isdark ==
                  false)
              ? ThemeMode.light
              : ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => const Homepage(),
            'Splashscreen': (context) => const Splashscreen(),
            'Detailspage' : (context ) => const Detailspage(),
          },
        );
      },
    ),
  );
}
