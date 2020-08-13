import 'package:flutter/material.dart';

import '../widgets/add_space/confirmation.dart';
import '../widgets/add_space/add_address.dart';
import '../widgets/add_space/images_and_utilities.dart';
import '../widgets/add_space/room_information.dart';

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

  final _maxStep = 4;

  Map<String, dynamic> _roomInformationData;
  Map<String, dynamic> _addressInfoData;
  Map<String, dynamic> imagesAndUtilitiesData;

  StepState _roomInfoStepState = StepState.editing;
  StepState _addressStepState = StepState.indexed;
  StepState _imagesAndUtilitiesStepState = StepState.indexed;
  StepState _confirmationStepState = StepState.indexed;

  int _currentStep = 0;

  void _onNext() {
    switch (_currentStep) {
      case 0:
        _roomInformationData = _roomInformationStateKey.currentState.saveForm();
        if (_roomInformationData != null) {
          setState(() {
            _currentStep += 1;
            _roomInfoStepState = StepState.complete;
            _addressStepState = StepState.editing;
          });
        }
        break;
      case 1:
        _addressInfoData =
            _addressInformationStateKey.currentState.saveAddressInfo();
        if (_addressInfoData != null) {
          setState(() {
            _currentStep += 1;
            _addressStepState = StepState.complete;
            _imagesAndUtilitiesStepState = StepState.editing;
          });
        }
        break;
      case 2:
        imagesAndUtilitiesData =
            _imagesAndUtilitiesStateKey.currentState.saveUtilitiesAndImages();
        if (imagesAndUtilitiesData != null) {
          setState(() {
            _currentStep += 1;
            _imagesAndUtilitiesStepState = StepState.complete;
            _confirmationStepState = StepState.editing;
          });
        }
        break;
      default:
        break;
    }
  }

  void _onBack() {
    switch (_currentStep) {
      case 0:
        break;
      case 1:
        _roomInfoStepState = StepState.editing;
        _addressStepState = StepState.indexed;
        break;
      case 2:
        _addressStepState = StepState.editing;
        _imagesAndUtilitiesStepState = StepState.indexed;
        break;
      case 3:
        _imagesAndUtilitiesStepState = StepState.editing;
        _confirmationStepState = StepState.indexed;
        break;
      default:
        break;
    }
    setState(() {
      if (_currentStep != 0) _currentStep -= 1;
    });
  }

  void createNewSpace() {}

  void _onDone() {
    final confirmationData =
        _confirmationStateKey.currentState.saveConfirmationForm();
    if (confirmationData != null) {
      _confirmationStepState = StepState.complete;
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

  bool _isLastStep() {
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
                  isActive: _currentStep == 0,
                  state: _roomInfoStepState),
              Step(
                  title: const Text("Address", style: TextStyle(fontSize: 18)),
                  content: AddAddress(
                    key: _addressInformationStateKey,
                  ),
                  state: _addressStepState,
                  isActive: _currentStep == 1),
              Step(
                  title: const Text("Images and Utilities",
                      style: TextStyle(fontSize: 18)),
                  content: ImagesAndUtilities(
                    key: _imagesAndUtilitiesStateKey,
                  ),
                  state: _imagesAndUtilitiesStepState,
                  isActive: _currentStep == 2),
              Step(
                  title: const Text("Confirmation",
                      style: TextStyle(fontSize: 18)),
                  content: Confirmation(
                    key: _confirmationStateKey,
                  ),
                  state: _confirmationStepState,
                  isActive: _currentStep == _maxStep - 1),
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
                      child: Text('Back'),
                      onPressed: onStepCancel,
                    ),
                    RaisedButton(
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
