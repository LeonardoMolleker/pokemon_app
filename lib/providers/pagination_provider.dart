import 'package:flutter/material.dart';
import '../utils/default_values.dart';

class PaginationProvider with ChangeNotifier {
  int _page = DefaultValues.defaultPage;
  String _offset = DefaultValues.defaultOffset;
  String _limit = DefaultValues.defaultLimit;

  int get page => _page;

  String get offset => _offset;

  set offset(String value) {
    _offset = value;
  }

  String get limit => _limit;

  set limit(String value) {
    _limit = value;
  }

  void changePage(PageEvent event){
    switch(event){
      case PageEvent.NEXT:{
        if (hasNextPage()) {
          _page++;
          _offset = (int.parse(_offset) + int.parse(_limit)).toString();
        }
        break;
      }
      case PageEvent.PREVIOUS:{
        if (hasPreviousPage()) {
          _page--;
          _offset = (int.parse(_offset) - int.parse(_limit)).toString();
        }
        break;
      }
    }
    notifyListeners();
  }

  bool hasPreviousPage() {
    return _page > 1;
  }

  bool hasNextPage() {
    return int.parse(_offset) + int.parse(_limit) < 1118;
  }
}

enum PageEvent{
  NEXT,
  PREVIOUS,
}
