import 'package:demo/models/thememodels.dart';
import 'package:flutter/material.dart';

class ThemeAccessProvider extends ChangeNotifier{

  ThemeModelAccess themeModelAccess = ThemeModelAccess(isdark: false);

//   ThemeAccessProvider({
//     required this.themeModelAccess

// });

  ChangeTheme(){
    themeModelAccess.isdark = !themeModelAccess.isdark;
    notifyListeners();
  }
}