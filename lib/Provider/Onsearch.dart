import 'package:flutter/foundation.dart';

class onsearch extends ChangeNotifier{
  int searched=-1;

  int countryfound1(){
    return searched;
  }

  countryfound(int i){
    searched=i;
    notifyListeners();
  }

  searchclear(){
    searched=-1;
    notifyListeners();
  }

}