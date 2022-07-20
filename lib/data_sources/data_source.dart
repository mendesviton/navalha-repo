import 'package:projeto_1/data_sources/user_data_source.dart';
import 'package:sqflite/sqflite.dart';

class DataAccess {
  late Database database;
  late UserDataAccess clientdao;

  DataAccess() {
    init();
  }

  void init() async {
    var databasesPath = await getDatabasesPath();
    String path = '${databasesPath}demo1.db';

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
          'CREATE TABLE TBCLIENTE (id INTEGER PRIMARY KEY ,'
          'name TEXT, email TEXT, password TEXT,cep TEXT,cpf TEXT)',
        );
      },
    );
    clientdao = UserDataAccess(database);
  }
}
