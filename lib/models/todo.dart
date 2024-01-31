class ToDo{
  String? todotext;
  String? id;
  bool isDone;
  ToDo({
    required this.id,
    required this.todotext,
    this.isDone = false,
});
  static List<ToDo> todoList(){
    return[
      ToDo(id: '01', todotext: 'Morning Code', isDone: true),
      ToDo(id: '02', todotext: 'Go To Church'),
      ToDo(id: '03', todotext: 'Give Lecture' ),
      ToDo(id: '04', todotext: 'Go To Gym')
    ];
  }
}