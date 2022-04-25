import 'package:flutter/cupertino.dart';

class SebhaProvider extends ChangeNotifier {
  int count1 = 0;
  int count2 = 0;
  int count3 = 0;
  int count4 = 0;
  int count5 = 0;
  int count6 = 0;
  int count7 = 0;
  int count8 = 0;
  int first1 = 0;
  int first2 = 0;
  int first3 = 0;
  int first4 = 0;
  int first5 = 0;
  int first6 = 0;
  int first7 = 0;
  int first8 = 0;
  int total = 0;

  increment(String text) {
    if (text == 'سبحان الله') {
      first1++;
      if (first1 > 33) {
        first1 = 0;
      }
      if (first1 > 0) {
        count1++;
      }
      notifyListeners();
    } else if (text == 'الحمدلله') {
      first2++;
      if (first2 > 33) {
        first2 = 0;
      }
      if (first2 > 0) {
        count2++;
      }
      notifyListeners();
    } else if (text == 'الله أكبر') {
      first3++;
      if (first3 > 33) {
        first3 = 0;
      }
      if (first3 > 0) {
        count3++;
      }
      notifyListeners();
    } else if (text == 'لا اله الا الله') {
      first4++;
      if (first4 > 33) {
        first4 = 0;
      }
      if (first4 > 0) {
        count4++;
      }
      notifyListeners();
    } else if (text == 'حسبي الله ونعم الوكيل') {
      first5++;
      if (first5 > 33) {
        first5 = 0;
      }
      if (first5 > 0) {
        count5++;
      }
      notifyListeners();
    } else if (text == 'أستغفر الله وأتوب اليه') {
      first6++;
      if (first6 > 33) {
        first6 = 0;
      }
      if (first6 > 0) {
        count6++;
      }
      notifyListeners();
    } else if (text == 'لا حول ولا قوة الا بالله') {
      first7++;
      if (first7 > 33) {
        first7 = 0;
      }
      if (first7 > 0) {
        count7++;
      }
      notifyListeners();
    } else if (text == 'سبحان الله وبحمده ، سبحان الله العظيم') {
      first8++;
      if (first8 > 33) {
        first8 = 0;
      }
      if (first8 > 0) {
        count8++;
      }
      notifyListeners();
    }
    total =
        count1 + count2 + count3 + count4 + count5 + count6 + count7 + count8;
    notifyListeners();
  }
}
