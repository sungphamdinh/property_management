import 'package:flutter/material.dart';
import 'package:property_management/shared/validation.dart';

class Confirmation extends StatefulWidget {
  Confirmation({Key key}) : super(key: key);
  @override
  ConfirmationState createState() => ConfirmationState();
}

class ConfirmationState extends State<Confirmation> {
  final _formKey = GlobalKey<FormState>();
  final _formData = {'phoneNumber': '', 'title': '', 'description': ''};

  Map<String, dynamic> saveConfirmationForm() {
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      _formKey.currentState.save();
      return _formData;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Phone number'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your phone number';
              }
              if (Validation.isValidPhoneNumber(value)) {
                return 'Please enter a valid phone number';
              }
              return null;
            },
            onSaved: (value) {
              _formData['phoneNumber'] = value;
            },
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
              maxLength: 60,
              decoration: InputDecoration(labelText: 'Title of the post'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your post title';
                }
                return null;
              },
              onSaved: (value) {
                _formData['title'] = value;
              }),
          SizedBox(
            height: 8,
          ),
          TextFormField(
              decoration: InputDecoration(labelText: 'Room description'),
              maxLines: 4,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your room description';
                }
                return null;
              },
              onSaved: (value) {
                _formData['description'] = value;
              })
        ],
      ),
    );
  }
}
