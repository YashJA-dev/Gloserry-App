import 'package:flutter/foundation.dart';

import '../model/Item.dart';

class GloceryList extends ChangeNotifier{
  List<Item> _gloceryList=[];
  void addItem({@required Item item}){
    _gloceryList.add(item);
    notifyListeners();
  }  
  get getGloceryList{
    return _gloceryList;
  }
  void remove({@required int index}){
    _gloceryList.removeAt(index);
    notifyListeners();
  }
}