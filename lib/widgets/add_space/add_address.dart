import 'package:flutter/material.dart';

class AddAddress extends StatefulWidget {
  AddAddress({Key key}) : super(key: key);
  @override
  AddAddressState createState() => AddAddressState();
}

class AddAddressState extends State<AddAddress> {
  static const double _dropdownWidth = 300;
  final _formKey = GlobalKey<FormState>();
  final _addressData = {
    'city': 'Ha Noi',
    'district': 'Quan 1',
    'ward': 'An Phu',
    'streetName': '',
    'houseNumber': ''
  };

  Map<String, dynamic> saveAddressInfo() {
    final isValidForm = _formKey.currentState.validate();
    if (isValidForm && _isDropdownInputsValid()) {
      _formKey.currentState.save();
      return _addressData;
    }
    return null;
  }

  bool _isDropdownInputsValid() {
    return !(_addressData['city'].isEmpty ||
        _addressData['district'].isEmpty ||
        _addressData['ward'].isEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("City"),
            Container(
              width: _dropdownWidth,
              child: DropdownButton(
                value: _addressData['city'],
                icon: Icon(Icons.keyboard_arrow_down),
                iconSize: 30,
                isDense: true,
                isExpanded: true,
                onChanged: (value) {
                  setState(() {
                    _addressData['city'] = value;
                  });
                },
                items: <String>["Ha Noi", "Ho Chi Minh"]
                    .map<DropdownMenuItem<String>>((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            Text("District"),
            Container(
              width: _dropdownWidth,
              child: DropdownButton(
                value: _addressData['district'],
                icon: Icon(Icons.keyboard_arrow_down),
                iconSize: 30,
                isDense: true,
                isExpanded: true,
                onChanged: (value) {
                  setState(() {
                    _addressData['district'] = value;
                  });
                },
                items: <String>["Quan 1", "Quan 2"]
                    .map<DropdownMenuItem<String>>((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            Text("Ward"),
            Container(
              width: _dropdownWidth,
              child: DropdownButton(
                value: _addressData['ward'],
                icon: Icon(Icons.keyboard_arrow_down),
                iconSize: 30,
                isDense: true,
                isExpanded: true,
                onChanged: (value) {
                  setState(() {
                    _addressData['ward'] = value;
                  });
                },
                items: <String>["An Phu", "Binh An"]
                    .map<DropdownMenuItem<String>>((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: _dropdownWidth,
              child: TextFormField(
                decoration: InputDecoration(labelText: "Street Name"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter street name";
                  }
                  return null;
                },
                onSaved: (value) {
                  _addressData['streetName'] = value;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: _dropdownWidth,
              child: TextFormField(
                decoration: InputDecoration(labelText: "House Number"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter house number";
                  }
                  return null;
                },
                onSaved: (value) {
                  _addressData['houseNumber'] = value;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
