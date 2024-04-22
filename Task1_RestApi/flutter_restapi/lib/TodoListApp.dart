import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_restapi/api/api.dart';
import 'package:flutter_restapi/models/todo.dart';

class TodoListApp extends StatefulWidget {
  const TodoListApp({super.key});

  @override
  _TodoListAppState createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  List<Todo> list = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getTodos();
  }

  Future<void> getTodos() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await Api.getTodos();
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        this.list = list.map((model) => Todo.fromJson(model)).toList();
        setState(() {
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load todos');
      }
    } catch (error) {
      print(error);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : list.isEmpty
          ? const Center(
        child: Text(
          'No todos available',
          style: TextStyle(fontSize: 18.0),
        ),
      )
          : ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, position) {
          return Card(
            elevation: 2.0,
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ListTile(
              title: Text(list[position].title!),
              subtitle: Text('ID: ${list[position].id}'),
              trailing: list[position].completed!
                  ? const Icon(Icons.check_circle, color: Colors.green)
                  : const Icon(Icons.radio_button_unchecked, color: Colors.grey),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getTodos();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
