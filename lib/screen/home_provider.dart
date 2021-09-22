import 'package:flutter/material.dart';
import 'package:test_huapcar/repository/load_data.dart';

class HomeProvider extends ChangeNotifier {
  List _textData = [];
  String _searchText = "";
  bool _checkIcon = false;

  HomeProvider();

  Future<List?> loadTextData() async {
    if (checkIcon == false) {
      var res = await getTextData();
      textData = res!;
      checkIcon = !checkIcon;
    } else {
      checkIcon = !checkIcon;
      textData = [];
    }
  }

  String get searchText => _searchText;

  set searchText(String value) {
    _searchText = value.toLowerCase();
    notifyListeners();
  }

  List get textData {
    return _textData.where((element) => (element ?? "").toLowerCase().contains(_searchText)).toList();
  }

  set textData(List value) {
    _textData = value;
    notifyListeners();
  }

  bool get checkIcon => _checkIcon;

  set checkIcon(bool value) {
    _checkIcon = value;
    notifyListeners();
  }
}
