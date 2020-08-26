import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:property_management/locator.dart';
import 'package:property_management/theme.dart';
import 'package:provider/provider.dart';

import './providers/providers.dart';
import './screens/screens.dart';

void main() {
  setupDependencyInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProvider.value(value: Spaces()),
        ChangeNotifierProvider.value(value: Users()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: appTheme(context),
        home: initialWidget(),
        routes: {
          AddSpaceScreen.routeName: (ctx) => AddSpaceScreen(),
          SpaceDetailScreen.routeName: (ctx) => SpaceDetailScreen(),
          SearchPlacesScreen.routeName: (ctx) => ChangeNotifierProvider(
              create: (ctx) => getIt.get<HistoryKeywords>(),
              child: SearchPlacesScreen()),
          AllSpacesScreen.routeName: (ctx) => AllSpacesScreen(),
        },
      ),
    );
  }

  Widget initialWidget() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (ctx, userSnapshot) {
        if (userSnapshot.connectionState == ConnectionState.waiting)
          return SplashScreen();
        if (userSnapshot.hasData) {
          return MainScreen();
        } else {
          return AuthScreen();
        }
      },
    );
  }
}

// flutter pub run build_runner build => run to generate codes for json serializable
