import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';
import '../models/todo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todolist = ToDo.todoList();
  List<ToDo> _searchForToDos = [];
  final _controller = TextEditingController();
  @override
  void initState() {
    _searchForToDos = todolist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBGcolor, appBar: buildAppBar(), body: buildBody());
  }

  Widget buildBody() {
    return Stack(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Stack(
          children: [
            searchBox(),
            ListView(
              controller: ScrollController(),
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 100, bottom: 20),
                  child: const Text(
                    'All ToDos',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                ),
                for (ToDo todoo in _searchForToDos.reversed)
                  ToDoItem(
                    todo: todoo,
                    ontapbar: _onTapBar,
                    ondeleteclicked: _onDeleteClicked,
                  ),
              ],
            ),
          ],
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                    bottom: 20.0, right: 20.0, left: 20.0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0)
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                      hintText: 'Add a new item', border: InputBorder.none),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20, right: 20),
              child: ElevatedButton(
                onPressed: () {
                  _addToDoItem(_controller.text);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: tdpurple,
                    minimumSize: const Size(60, 60),
                    elevation: 10),
                child: const Text(
                  '+',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    ]);
  }

  void _onTapBar(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _onDeleteClicked(String id) {
    setState(() {
      todolist.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todolist.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todotext: toDo));
    });
    _controller.clear();
  }

  void _searchFilter(String keyword) {
    List<ToDo> results = [];
    if (keyword.isEmpty) {
      results = todolist;
    } else {
      results = todolist
          .where((item) =>
              item.todotext!.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _searchForToDos = results;
    });
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      backgroundColor: tdBGcolor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
  ),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/avatar.jpg')),
          ),
        ],
      ),
    );
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
      child:  TextField(

        showCursor: true,
        scribbleEnabled: true,

        onChanged: (value) => _searchFilter(value),
        decoration:const InputDecoration(
          enabled: true,
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: tdBlack,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: tdGrey)),
      ),
    );
  }
}
