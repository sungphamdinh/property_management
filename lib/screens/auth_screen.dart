import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../widgets/auth_form.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _authProvider;

  @override
  void initState() {
    super.initState();
    _authProvider = Provider.of(context, listen: false);
  }

  void _submitAuthForm(String email, String username, String password,
      File image, bool isLogin, BuildContext context) async {
    try {
      if (isLogin) {
        await _authProvider.loginWithUser(email, password);
      } else {
        await _authProvider.createUser(email, password, username, image);
      }
    } on PlatformException catch (error) {
      var message = 'An error occurred, please check your credentials';
      if (error.message != null) {
        message = error.message;
      }
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).errorColor,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_submitAuthForm),
    );
  }
}
