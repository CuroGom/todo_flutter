import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/vo/todo_vo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoVo>(
          builder: (_) => TodoVo(),
        ),
      ],
      child: MaterialApp(
        title: 'ToDo Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TodoPage(),
      ),
    );
  }
}

class TodoPage extends StatefulWidget {
  const TodoPage({
    Key key,
  }) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    TodoVo todoPage = Provider.of<TodoVo>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Todo List',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.edit, color: Colors.grey, size: 15,),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10),
                    TodoList(TodoCategory.todo),
                    SizedBox(height: 15),
                    TodoList(TodoCategory.done),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  TodoCategory _category;
  String _title;
  Color _keyColor;
  Color _backColor;

  TodoList(this._category);

  @override
  Widget build(BuildContext context) {
    switch (_category) {
      case TodoCategory.todo:
        _title = 'To Do';
        _keyColor = Colors.indigo;
        _backColor = Colors.indigo[100];
        break;
      case TodoCategory.done:
        _title = 'Done';
        _keyColor = Colors.grey;
        _backColor = Colors.grey[300];
        break;
    }

    return Stack(
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: 50),
          child: Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: _backColor,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TodoItem(
                  keyColor: _keyColor,
                  title: 'GDG Korea WebTech 발표',
                ),
                TodoItem(
                  keyColor: _keyColor,
                  title: 'GDG Korea WebTech 발표',
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 10,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 3,
              horizontal: 5,
            ),
            decoration: BoxDecoration(
                color: _keyColor, borderRadius: BorderRadius.circular(10)),
            child: Text(
              _title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}

class TodoItem extends StatelessWidget {
  final Color keyColor;
  final String title;
  String location;

  TodoItem({this.keyColor, this.title, this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
      decoration: BoxDecoration(
          border: Border(left: BorderSide(color: keyColor, width: 5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title),
              location != null ? Text(location) : Container(),
            ],
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                Icons.close,
                color: Colors.grey,
                size: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum TodoCategory { todo, done }
