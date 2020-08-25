import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:property_management/theme.dart';
import 'package:provider/provider.dart';

import './data/data.dart';
import './providers/providers.dart';
import './screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final authRepository = AuthFireBase();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth(repository: authRepository)),
        ChangeNotifierProvider.value(
            value: Spaces(repository: SpacesFirebaseStorage())),
        ChangeNotifierProxyProvider<Auth, Users>(
          update: (ctx, auth, users) => Users(
              repository: UsersFirebaseStorage(),
              authRepository: authRepository),
        )
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
            } else {
              return AuthScreen();
            }
          },
        ),
        routes: {
          AddSpaceScreen.routeName: (ctx) => AddSpaceScreen(),
          SpaceDetailScreen.routeName: (ctx) => SpaceDetailScreen(),
          SearchPlacesScreen.routeName: (ctx) => ChangeNotifierProvider(
              create: (ctx) =>
                  HistoryKeywords(repository: KeywordsPrefStorage()),
              child: SearchPlacesScreen()),
          AllSpacesScreen.routeName: (ctx) => AllSpacesScreen(),
        },
      ),
    );
  }
}

// flutter pub run build_runner build => run to generate codes for json serializable
