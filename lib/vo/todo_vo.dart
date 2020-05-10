import 'package:flutter/widgets.dart';

class TodoVo extends ChangeNotifier
{
  String userTitle;
  List<TodoThings> doingList;
  List<TodoThings> doneList;

  TodoVo({this.userTitle = 'Todo Test!'});

  void setTitle (String newTitle) {
    this.userTitle = newTitle;
  }
}

class TodoThings {
  String _todoTitle;
  String _location;

  String get todoTitle => _todoTitle;

  set todoTitle(String value) {
    _todoTitle = value;
  }

  String get location => _location;

  set location(String value) {
    _location = value;
  }
}