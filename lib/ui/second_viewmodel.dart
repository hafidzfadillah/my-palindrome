import 'package:flutter/material.dart';
import 'package:suitmedia_test/models/user.dart';
import 'package:http/http.dart' as http;

class SecondViewmodel extends ChangeNotifier {
  List<UserData> _userList = [];
  List<UserData> get userList => _userList;

  int _currentPage = 1;
  final int _dataPerPage = 10;

  UserData? _selectedUser;

  bool _onSearch = false;
  bool get onSearch => _onSearch;

  String get userName {
    if (_selectedUser == null) {
      return 'Selected User Name';
    }
    return '${_selectedUser!.firstName} ${_selectedUser!.lastName}';
  }

  void fetchUsers() async {
    setOnSearch(true);
    final uri = Uri.parse(
        'https://reqres.in/api/users?page=$_currentPage&per_page=$_dataPerPage');
    final response = await http.get(uri);
    print(uri);

    if (response.statusCode == 200) {
      final parsedResponse = GetUser.fromRawJson(response.body);

      _userList.addAll(parsedResponse.data ?? []);

      print('length: ${userList.length}');
    }

    setOnSearch(false);
  }

  void nextPage({int? page}) {
    if (page != null) {
      _userList.clear();
      _currentPage = page;
    } else {
      _currentPage++;
    }
    fetchUsers();
  }

  void selectUser(UserData user) {
    _selectedUser = user;
    notifyListeners();
  }

  void setOnSearch(bool mOnSearch) {
    _onSearch = mOnSearch;
    notifyListeners();
  }
}
