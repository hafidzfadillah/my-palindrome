import 'package:flutter/material.dart';

class FirstViewModel extends ChangeNotifier {
  String? _savedName;
  String? get savedName => _savedName;

  bool storeName(String name) {
    if (name.isEmpty) return false;
    _savedName = name;

    notifyListeners();
    return true;
  }

  bool isPalindrome(String word) {
    var prevWord = word.replaceAll(RegExp(r'[^a-zA-Z]'), '').toLowerCase();

    if (prevWord.isEmpty) return false;

    var mWord =
        prevWord.replaceAll(RegExp(r'[^a-zA-Z]'), '').toLowerCase().split('');

    print('word as list: $mWord');

    if (mWord.length == 1) return true;

    int left = 0;
    int right = mWord.length - 1;

    do {
      var a = mWord[left];
      var b = mWord[right];
      mWord[left] = b;
      mWord[right] = a;

      left += 1;
      right -= 1;
    } while (left < right);

    print('original word: $prevWord');
    print("reversed: ${mWord.join()}");

    return prevWord == mWord.join();
  }
}
