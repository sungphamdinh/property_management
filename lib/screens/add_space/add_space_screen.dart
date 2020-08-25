import 'package:flutter/material.dart';
import 'package:property_management/models/space.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';
import './widgets/widgets.dart';

enum AddSpaceSteps {
  roomInformation,
  address,
  imagesAndUtilities,
  confirmation
}

class AddSpaceScreen extends StatefulWidget {
  static const routeName = "/add-product";
  @override
  _AddSpaceScreenState createState() => _AddSpaceScreenState();
}

class _AddSpaceScreenState extends State<AddSpaceScreen> {
  final _roomInformationStateKey = GlobalKey<RoomInformationState>();
  final _addressInformationStateKey = GlobalKey<AddAddressState>();
  final _imagesAndUtilitiesStateKey = GlobalKey<ImagesAndUtilitiesState>();
  final _confirmationStateKey = GlobalKey<ConfirmationState>();

  Map<String, dynamic> _roomInformationData;
  Map<String, dynamic> _addressInfoData;
  Map<String, dynamic> _imagesAndUtilitiesData;

  StepState _roomInfoStepState = StepState.editing;
  StepState _addressStepState = StepState.indexed;
  StepState _imagesAndUtilitiesStepState = StepState.indexed;
  StepState _confirmationStepState = StepState.indexed;

  int _currentStep = AddSpaceSteps.roomInformation.index;
  Space currentSpace;
  bool _isLoading = false;

  void _onNext() {
    if (_currentStep == AddSpaceSteps.roomInformation.index) {
      _roomInformationData = _roomInformationStateKey.currentState.saveForm();
      if (_roomInformationData != null) {
        setState(() {
          _currentStep += 1;
          _roomInfoStepState = StepState.complete;
          _addressStepState = StepState.editing;
        });
      }
    } else if (_currentStep == AddSpaceSteps.address.index) {
      _addressInfoData =
          _addressInformationStateKey.currentState.saveAddressInfo();
      if (_addressInfoData != null) {
        setState(() {
          _currentStep += 1;
          _addressStepState = StepState.complete;
          _imagesAndUtilitiesStepState = StepState.editing;
        });
      }
    } else if (_currentStep == AddSpaceSteps.imagesAndUtilities.index) {
      _imagesAndUtilitiesData =
          _imagesAndUtilitiesStateKey.currentState.saveUtilitiesAndImages();
      if (_imagesAndUtilitiesData != null) {
        setState(() {
          _currentStep += 1;
          _imagesAndUtilitiesStepState = StepState.complete;
          _confirmationStepState = StepState.editing;
        });
      }
    }
  }

  void _onBack() {
    if (_currentStep == AddSpaceSteps.address.index) {
      _roomInfoStepState = StepState.editing;
      _addressStepState = StepState.indexed;
    } else if (_currentStep == AddSpaceSteps.imagesAndUtilities.index) {
      _addressStepState = StepState.editing;
      _imagesAndUtilitiesStepState = StepState.indexed;
    } else if (_currentStep == AddSpaceSteps.confirmation.index) {
      _imagesAndUtilitiesStepState = StepState.editing;
      _confirmationStepState = StepState.indexed;
    }
    setState(() {
      if (_currentStep != 0) _currentStep -= 1;
    });
  }

  void createNewSpace(Map<String, dynamic> confirmationJson) async {
    Map<String, dynamic> spaceJson = {};
    final userId = Provider.of<Auth>(context, listen: false).userId;

    spaceJson.addAll(_roomInformationData);
    spaceJson.putIfAbsent('address', () => _addressInfoData);
    spaceJson.putIfAbsent('owner',
        () => {'id': userId, 'phoneNumber': confirmationJson['phoneNumber']});
    spaceJson.addAll(confirmationJson);
    spaceJson.addAll(_imagesAndUtilitiesData);

    setState(() {
      _isLoading = true;
    });

    await Provider.of<Spaces>(context, listen: false).createNewSpace(spaceJson);

    setState(() {
      _isLoading = false;
    });

    Navigator.of(context).pop();
  }

  void _onDone() {
    final confirmationData =
        _confirmationStateKey.currentState.saveConfirmationForm();
    if (confirmationData != null) {
      _confirmationStepState = StepState.complete;
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text('Please confirm you want to create new space?'),
              actions: [
                RaisedButton(
                  child: const Text("Cancel"),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                RaisedButton(
                  child: const Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    createNewSpace(confirmationData);
                  },
                )
              ],
            );
          });
    }
  }

  bool _isLastStep() {
    return _currentStep == AddSpaceSteps.confirmation.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create new space"),
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
                  isActive: _currentStep == AddSpaceSteps.roomInformation.index,
                  state: _roomInfoStepState),
              Step(
                  title: const Text("Address", style: TextStyle(fontSize: 18)),
                  content: AddAddress(
                    key: _addressInformationStateKey,
                  ),
                  state: _addressStepState,
                  isActive: _currentStep == AddSpaceSteps.address.index),
              Step(
                  title: const Text("Images and Utilities",
                      style: TextStyle(fontSize: 18)),
                  content: ImagesAndUtilities(
                    key: _imagesAndUtilitiesStateKey,
                  ),
                  state: _imagesAndUtilitiesStepState,
                  isActive:
                      _currentStep == AddSpaceSteps.imagesAndUtilities.index),
              Step(
                  title: const Text("Confirmation",
                      style: TextStyle(fontSize: 18)),
                  content: Confirmation(
                    key: _confirmationStateKey,
                  ),
                  state: _confirmationStepState,
                  isActive: _currentStep == AddSpaceSteps.confirmation.index),
            ],
            onStepContinue: _isLastStep() ? _onDone : _onNext,
            onStepCancel: _onBack,
            currentStep: _currentStep,
            controlsBuilder: (ctx, {onStepContinue, onStepCancel}) {
              return Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                      child: const Text('Back'),
                      onPressed: onStepCancel,
                    ),
                    _isLoading
                        ? CircularProgressIndicator()
                        : RaisedButton(
                            child: Text(_isLastStep() ? 'Done' : 'Next'),
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
