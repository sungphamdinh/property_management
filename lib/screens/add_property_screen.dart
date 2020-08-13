import 'package:flutter/material.dart';

import '../widgets/add_product/confirmation.dart';
import '../widgets/add_product/add_address.dart';
import '../widgets/add_product/images_and_utilities.dart';
import '../widgets/add_product/room_information.dart';

class AddPropertyScreen extends StatefulWidget {
  static const routeName = "/add-product";
  @override
  _AddPropertyScreenState createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  final _roomInformationStateKey = GlobalKey<RoomInformationState>();
  final _addressInformationStateKey = GlobalKey<AddAddressState>();
  final _imagesAndUtilitiesStateKey = GlobalKey<ImagesAndUtilitiesState>();
  final _confirmationStateKey = GlobalKey<ConfirmationState>();
  int _currentStep = 0;
  final _maxStep = 4;
  Map<String, dynamic> _roomInformationJson;
  Map<String, dynamic> _addressInfoJson;

  void onContinuePressed() {
    switch (_currentStep) {
      case 0:
        _roomInformationJson = _roomInformationStateKey.currentState.saveForm();
        if (_roomInformationJson != null) {
          setState(() {
            _currentStep += 1;
          });
        }
        break;
      case 1:
        _addressInfoJson =
            _addressInformationStateKey.currentState.saveAddressInfo();
        if (_addressInfoJson != null) {
          setState(() {
            _currentStep += 1;
          });
        }
        break;
      case 2:
        final imagesAndUtilitiesJson =
            _imagesAndUtilitiesStateKey.currentState.saveUtilitiesAndImages();
        if (imagesAndUtilitiesJson != null) {
          setState(() {
            _currentStep += 1;
          });
        }
        break;
      default:
        break;
    }
  }

  void createNewSpace() {}

  void onDone() {
    final confirmationData =
        _confirmationStateKey.currentState.saveConfirmationForm();
    if (confirmationData != null) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text('Please confirm you want to create new space?'),
              actions: [
                RaisedButton(
                  child: Text("Cancel"),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                RaisedButton(
                  child: Text("Ok"),
                  onPressed: createNewSpace,
                )
              ],
            );
          });
    }
  }

  bool isLastStep() {
    return _currentStep == _maxStep - 1;
  }

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
                  content: ImagesAndUtilities(
                    key: _imagesAndUtilitiesStateKey,
                  )),
              Step(
                  title: const Text("Confirmation",
                      style: TextStyle(fontSize: 18)),
                  content: Confirmation(
                    key: _confirmationStateKey,
                  )),
            ],
            onStepContinue: isLastStep() ? onDone : onContinuePressed,
            onStepCancel: () {
              setState(() {
                if (_currentStep != 0) _currentStep -= 1;
              });
            },
            currentStep: _currentStep,
            controlsBuilder: (ctx, {onStepContinue, onStepCancel}) {
              return Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                      child: Text('Back'),
                      onPressed: onStepCancel,
                    ),
                    RaisedButton(
                      child: Text(isLastStep() ? 'Done' : 'Next'),
                      onPressed: onStepContinue,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
