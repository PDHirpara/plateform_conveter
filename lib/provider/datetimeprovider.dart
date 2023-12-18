import 'package:ch_2/modal/datetimemodal.dart';
import 'package:flutter/material.dart';

import '../modal/profile_variable_model.dart';

class datetimeprovider extends ChangeNotifier {
  DateTimemodel dateTimeModel = DateTimemodel(initialdate: DateTime.now());
  timemodal Timemodal = timemodal(initialtime: TimeOfDay.now());

  void pickdate(DateTime n) {
    dateTimeModel.initialdate = n;
    notifyListeners();
  }

  void picktime(TimeOfDay n) {
    Timemodal.initialtime = n;
    notifyListeners();
  }
}

class Contactprovider extends ChangeNotifier {
  static List<Contact> allcontact = [];
  List<Contact> get contact => [];

  void add_contact(Contact add) {
    allcontact.add(add);
    notifyListeners();
  }
}
class Contactprovider1 extends ChangeNotifier {
  static List<Contact> allcontact1 = [];

  void add_contact1(Contact add) {
    allcontact1.add(add);
    notifyListeners();
  }
}
