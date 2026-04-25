class ToDo{
  final String id;
  final String title;
  final bool isCompleted;
  const ToDo({ required this.id, required this.title, required this.isCompleted});

  ToDo copyWith({String? title,bool? isCompleted}) {
    return ToDo(id: id, title: title??this.title, isCompleted: isCompleted??this.isCompleted);
}
}