class Todo {
  int? id;
  int? userId;
  bool? completed;
  String? title;

  Todo(int this.id, int this.userId, bool this.completed, String this.title);

  Todo.fromJson(Map json) {
    id = json["id"];
    userId = json["userId"];
    completed = json["completed"];
    title = json["title"];
  }
  Map toJson() {
    return {
      "id": id,
      "userId": userId,
      "completed": completed,
      "title": title,
    };
  }
}