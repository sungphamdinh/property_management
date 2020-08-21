import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:property_management/providers/history_keywords.dart';
import 'package:property_management/screens/home/home_screen.dart';
import 'package:property_management/screens/main_screen.dart';
import 'package:property_management/screens/sanbox.dart';
import 'package:property_management/screens/search_places/seach_places_screen.dart';
import 'package:property_management/screens/space_detail/space_detail.dart';
import 'package:property_management/theme.dart';
import 'package:provider/provider.dart';

import './screens/flash_screen.dart';
import './providers/auth.dart';
import './providers/spaces.dart';
import 'screens/add_space/add_space_screen.dart';
import './screens/auth_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProvider.value(value: Spaces())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: appTheme(context),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (ctx, userSnapshot) {
            if (userSnapshot.connectionState == ConnectionState.waiting)
              return FlashScreen();
            if (userSnapshot.hasData) {
              return MainScreen();
//              return SandboxScreen();
            } else {
              return AuthScreen();
            }
          },
        ),
        routes: {
          AddSpaceScreen.routeName: (ctx) => AddSpaceScreen(),
          SpaceDetailScreen.routeName: (ctx) => SpaceDetailScreen(),
          SearchPlacesScreen.routeName: (ctx) => ChangeNotifierProvider(
              create: (ctx) => HistoryKeywords(), child: SearchPlacesScreen())
        },
      ),
    );
  }
}

// flutter pub run build_runner build => run to generate codes for json serializable
