import 'package:flutter/material.dart';

import '../../models/space.dart';
import '../../shared/validation.dart';

class RoomInformation extends StatefulWidget {
  RoomInformation({Key key}) : super(key: key);
  @override
  RoomInformationState createState() => RoomInformationState();
}

class RoomInformationState extends State<RoomInformation> {
  bool _isElectricityCostFree = false;
  bool _isWaterCostFree = false;
  static const double textFieldFormWidth = 250;
  final _formKey = GlobalKey<FormState>();
  final _formData = {
    'roomType': RoomType.roomForRent,
    'numberOfRooms': 0,
    'capacity': 0,
    'roomArea': 0,
    'price': 0,
    'deposit': 0,
    'electricityCost': 0,
    'waterCost': 0,
    'isSpaceForParking': false
  };
  RoomType _currentRoomType = RoomType.roomForRent;
  final _electricityCostEditor = TextEditingController();
  final _waterCostEditor = TextEditingController();

  Map<String, dynamic> saveForm() {
    FocusScope.of(context).unfocus();
    final isValidated = _formKey.currentState.validate();
    if (isValidated) {
      _formKey.currentState.save();
      return _formData;
    }
    return null;
  }

  void setRoomType(RoomType type) {
    _formData['roomType'] = type;
    setState(() {
      _currentRoomType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RadioListTile<RoomType>(
              title: const Text("Room for rent"),
              groupValue: _currentRoomType,
              value: RoomType.roomForRent,
              onChanged: setRoomType,
            ),
            RadioListTile<RoomType>(
              title: const Text("Room for share"),
              groupValue: _currentRoomType,
              value: RoomType.roomForShare,
              onChanged: setRoomType,
            ),
            RadioListTile<RoomType>(
              title: const Text("House"),
              groupValue: _currentRoomType,
              value: RoomType.house,
              onChanged: setRoomType,
            ),
            RadioListTile<RoomType>(
              title: const Text("Apartment"),
              groupValue: _currentRoomType,
              value: RoomType.apartment,
              onChanged: setRoomType,
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Container(
                margin: EdgeInsets.only(right: 8),
                width: textFieldFormWidth,
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Number of rooms"),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (Validation.isValidNumber(value)) {
                      return "Please enter number of rooms";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _formData['numberOfRooms'] = int.parse(value);
                  },
                ),
              ),
              Text("room(s)")
            ]),
            Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Container(
                margin: EdgeInsets.only(right: 8),
                width: textFieldFormWidth - 40,
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Capacity"),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (Validation.isValidNumber(value)) {
                      return "Please enter number of capacity";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _formData['capacity'] = int.parse(value);
                  },
                ),
              ),
              Text("person(s)/room")
            ]),
            Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Container(
                margin: EdgeInsets.only(right: 8),
                width: textFieldFormWidth,
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Room area"),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (Validation.isValidNumber(value)) {
                      return "Please enter number of room area";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _formData['roomArea'] = double.parse(value);
                  },
                ),
              ),
              Text("m2")
            ]),
            SizedBox(
              height: 30,
            ),
            Text(
              "Expenses",
              style: Theme.of(context).textTheme.headline6,
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Container(
                margin: EdgeInsets.only(right: 8),
                width: textFieldFormWidth - 10,
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Rental price"),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (Validation.isValidNumber(value)) {
                      return "Please enter number of rental price";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _formData['price'] = double.parse(value);
                  },
                ),
              ),
              Text("\$/room")
            ]),
            TextFormField(
              decoration: InputDecoration(labelText: "Deposit"),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (Validation.isValidNumber(value)) {
                  return "Please enter number of deposit";
                }
                return null;
              },
              onSaved: (value) {
                _formData['deposit'] = double.parse(value);
              },
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8),
                  width: textFieldFormWidth - 10,
                  child: TextFormField(
                    controller: _electricityCostEditor,
                    decoration: InputDecoration(labelText: "Electricity cost"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (_isElectricityCostFree) return null;
                      if (Validation.isValidNumber(value)) {
                        return "Please enter number of electricity cost";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      try {
                        _formData['electricityCost'] = double.parse(value);
                      } catch (_) {
                        _formData['electricityCost'] = 0;
                      }
                    },
                  ),
                ),
                Text("\$"),
                Checkbox(
                  value: _isElectricityCostFree,
                  onChanged: (value) {
                    _electricityCostEditor.text = (value == true) ? 'Free' : "";
                    setState(() {
                      _isElectricityCostFree = value;
                    });
                  },
                )
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8),
                  width: textFieldFormWidth - 10,
                  child: TextFormField(
                    controller: _waterCostEditor,
                    decoration: InputDecoration(labelText: "Water cost"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (_isWaterCostFree) return null;
                      if (Validation.isValidNumber(value)) {
                        return "Please enter number of water cost";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      try {
                        _formData['waterCost'] = double.parse(value);
                      } catch (_) {
                        _formData['waterCost'] = 0;
                      }
                    },
                  ),
                ),
                Text("\$"),
                Checkbox(
                  value: _isWaterCostFree,
                  onChanged: (value) {
                    _waterCostEditor.text = (value == true) ? 'Free' : "";
                    setState(() {
                      _isWaterCostFree = value;
                    });
                  },
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: _formData['isSpaceForParking'],
                  onChanged: (value) {
                    setState(() {
                      _formData['isSpaceForParking'] = value;
                    });
                  },
                ),
                Text("Is there space for packing?")
              ],
            )
          ],
        ),
      ),
    );
  }
}
