import 'dart:io';

import '../providers/auth.dart';
import '../widgets/user_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthForm extends StatefulWidget {
  final void Function(String email, String username, String password,
      File image, bool isLogin, BuildContext context) submitForm;
  AuthForm(this.submitForm);
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _authData = {'email': '', 'user_name': '', 'password': ''};
  File _userImage;
  var _isLogin = true;

  void _pickedImage(File image) {
    _userImage = image;
  }

  void _onFormSave() {
    FocusScope.of(context).unfocus();

    if (!_isLogin && _userImage == null) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Please pick a image"),
        backgroundColor: Theme.of(context).errorColor,
      ));
      return;
    }

    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      widget.submitForm(
          _authData['email'].trim(),
          _authData['user_name'].trim(),
          _authData['password'].trim(),
          _userImage,
          _isLogin,
          context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (!_isLogin)
                    UserImagePicker(
                      pickedImage: _pickedImage,
                    ),
                  TextFormField(
                    key: ValueKey('email'),
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    enableSuggestions: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Email Address'),
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _authData['email'] = value;
                    },
                  ),
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('user_name'),
                      autocorrect: true,
                      textCapitalization: TextCapitalization.words,
                      enableSuggestions: false,
                      decoration: InputDecoration(labelText: 'Username'),
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return 'Enter at least 4 characters';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _authData['user_name'] = value;
                      },
                    ),
                  TextFormField(
                    key: ValueKey('password'),
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
                    validator: (value) {
                      if (value.isEmpty || value.length < 7) {
                        return 'Password need to 7 characters long';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _authData['password'] = value;
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Consumer<Auth>(
                    builder: (ctx, auth, child) {
                      return auth.isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : RaisedButton(
                              child: Text(_isLogin ? 'Login' : 'Register'),
                              onPressed: _onFormSave,
                            );
                    },
                  ),
                  FlatButton(
                    child: Text(_isLogin
                        ? 'Create new account'
                        : 'I already have an account'),
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
