import 'package:flutter/material.dart';

import '../widgets/add_product/add_address.dart';
import '../widgets/add_product/images_and_utilities.dart';
import '../widgets/add_product/room_information.dart';

class AddProperty extends StatefulWidget {
  static const routeName = "/add-product";
  @override
  _AddPropertyState createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddProperty> {
  final _roomInformationStateKey = GlobalKey<RoomInformationState>();
  final _addressInformationStateKey = GlobalKey<AddAddressState>();
  final _imagesAndUtilitiesStateKey = GlobalKey<AddAddressState>();
  int _currentStep = 0;
  Map<String, dynamic> _roomInformationJson;
  Map<String, dynamic> _addressInfoJson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add your space"),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          child: Stepper(
            steps: [
              Step(
                  title: const Text(
                    "Room Information",
                    style: TextStyle(fontSize: 18),
                  ),
                  content: RoomInformation(
                    key: _roomInformationStateKey,
                  ),
                  isActive: true),
              Step(
                  title: const Text("Address", style: TextStyle(fontSize: 18)),
                  content: AddAddress(
                    key: _addressInformationStateKey,
                  )),
              Step(
                  title: const Text("Images and Utilities",
                      style: TextStyle(fontSize: 18)),
                  content: ImagesAndUtilities()),
              Step(
                  title: const Text("Confirmation",
                      style: TextStyle(fontSize: 18)),
                  content: Container(
                    height: 100,
                  )),
            ],
            onStepContinue: () {
              switch (_currentStep) {
                case 0:
                  _roomInformationJson =
                      _roomInformationStateKey.currentState.saveForm();
                  if (_roomInformationJson != null) {
                    setState(() {
                      _currentStep += 1;
                    });
                  }
                  break;
                case 1:
                  _addressInfoJson = _addressInformationStateKey.currentState
                      .saveAddressInfo();
                  if (_addressInfoJson != null) {
                    setState(() {
                      _currentStep += 1;
                    });
                  }
                  break;
                default:
                  break;
              }
            },
            onStepCancel: () {
              setState(() {
                if (_currentStep != 0) _currentStep -= 1;
              });
            },
            currentStep: _currentStep,
          ),
        ),
      ),
    );
  }
}
