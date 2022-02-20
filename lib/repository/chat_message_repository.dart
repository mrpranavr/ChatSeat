import 'package:onionchatflutter/model/chat_message.dart';
import 'package:onionchatflutter/repository/messages_table.dart' as messages_table;

import 'package:sqflite/sqflite.dart';

class ChatMessageRepository {
  final Database database;

  ChatMessageRepository(this.database);

  Future<Message> insert(Message message) async {
    message.id = await database.insert(messages_table.tableName, message.toMap());
    return todo;
  }

  Future<Message> getTodo(int id) async {
    List<Map> maps = await db.query(tableTodo,
        columns: [columnId, columnDone, columnTitle],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Message.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db.delete(tableTodo, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(Todo todo) async {
    return await db.update(tableTodo, todo.toMap(),
        where: '$columnId = ?', whereArgs: [todo.id]);
  }

  Future close() async => db.close();
}