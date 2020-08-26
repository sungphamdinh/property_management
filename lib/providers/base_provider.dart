import 'package:flutter/foundation.dart';

enum ProviderState { Idle, Busy }

class BaseProvider with ChangeNotifier {
  ProviderState _state = ProviderState.Idle;
  ProviderState get state => _state;

  void setState(ProviderState state) {
    _state = state;
    notifyListeners();
  }
}
