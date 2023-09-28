import 'package:flutter/material.dart';
import 'package:technical_exam/models/todo.dart';
import 'package:technical_exam/services/todo_api_service.dart';

class Screen1 extends StatelessWidget {
  final TodoApiService apiService =
      TodoApiService('https://dummyjson.com/todos');

  Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'First',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: FutureBuilder<List<Todo>>(
        future: apiService.fetchTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final todos = snapshot.data;
            return ListView.builder(
              itemCount: todos?.length,
              itemBuilder: (context, index) {
                final todo = todos![index];
                Color iconBackgroundColor =
                    todo.completed ? Colors.green : Colors.red;
                return Container(
                  color: Colors.grey[200],
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(5),
                    leading: Container(
                      color: iconBackgroundColor,
                      padding: const EdgeInsets.all(15),
                      child: Icon(
                        todo.completed ? Icons.check : Icons.close,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      todo.todo,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
