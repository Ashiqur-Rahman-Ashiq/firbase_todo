import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_todo/models/todo_model.dart';

class DataRepository {
  final CollectionReference collection = FirebaseFirestore.instance.collection('todos');


  Stream<QuerySnapshot> getStreem() {
    return collection.snapshots();
  }

  Future <DocumentReference> addTodo(Todo todo){
    return collection.add(todo.toJson());
  }

  void UpdateTodo(Todo todo) async{
    await collection.doc(todo.id.toString()).update(todo.toJson());
  }

  void DeleteTodo(Todo todo) async{
    await collection.doc(todo.id.toString()).delete();
  }


}

