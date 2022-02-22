import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

class UserBD {
  static Database? _db;
  GetStorage box = GetStorage();
  Future<Database> init() async {
    var databasesPath = await getApplicationDocumentsDirectory();

    String path = join(databasesPath.path, 'UserSession.db');

    _db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("""CREATE TABLE IF NOT EXISTS Member (
      
       userId INTEGER,
        nom String,
        prenom String,
       phone String, 
       token String,
       refreshToken String,
       master String)""");

      await db.execute("""CREATE TABLE IF NOT EXISTS Session (
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       memberId INTEGER REFERENCES Member,
       dateStart String,
       dateEnd String
      )""");
    });
    print("La bd a ete cree");
    print(_db);
    print("Go next");

    return _db!;
  }

  insert(id, nom, prenom, phone, token, refreshToken, master) async {
    
      var a = await _db!.insert("Member", {
        "userId": id,
        "nom": nom,
        "prenom": prenom,
        "phone": phone,
        "token": token,
        "refreshToken": refreshToken,
        "master": master
      });
 
  
  }

  
  select() async {
    var data = await _db!.rawQuery('SELECT * FROM Member');
    
    return data;
  }
 
  deleteSession(id) async {
    print("devbut detellet 'userId = $id'  ");
    var delette0 = await _db!.delete("Session", where: 'memberId =$id');
    var delette = await _db!.delete("Member", where: 'userId =$id');

    print(delette);
    var master = await select();
   
    print("fin delette");
  }

  updateMember(data, id) async {
    print("devbut update $data   voici id $data  ");
    var update = await _db!.update("Member", data, where: 'userId = $id');
    print(update);
    print('userId = $id');
    print("finnn");
  }

  updateSession(id) async {
    var session =
        await _db!.rawQuery('SELECT * FROM Session WHERE memberId= $id ');
    var data = {
      "dateEnd": (DateTime.parse(session[0]['dateEnd'].toString())
              .add(Duration(minutes: 30)))
          .toString(),
    };
    print("*---------------------------up date session $data");

    await _db!.update("Session", data, where: 'memberId = $id');
    var data1 = await _db!.rawQuery('SELECT * FROM Session');
    print("*---------------------------up date session $data1");
    print('userId = $id');
    print("finnn");
  }

  dropData() async {
    print("start drop   data  ");
    var drop = await _db!.delete("Member");
    var drops = await _db!.delete("Session");
    print(drop);
    print(drops);

    print("finnn drop");
  }
}
