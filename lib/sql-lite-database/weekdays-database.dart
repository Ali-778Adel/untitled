import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/bloc/home-page-bloc/weekdays-missions-cubit.dart';

class WeekdaysDatabase  {
  Database? database;
  Map<String,dynamic>data={
    'missionName':'',
    'missionTime':'',
  };

  void createWeekdaysDatabase() async {
    database = await openDatabase(
      'weekdays.dbase',
      version: 1,
      onCreate: (database, version) {
        database
            .execute('CREATE TABLE weekdaysdb('
                'id INTEGER PRIMARY KEY,'
                'missionName TEXT,'
                'missionTime TEXT,'
                'missionLocationName TEXT,'
                'missionDate TEXT,'
                'missionDescription TEXT)')
            .then((value) {
          print('Weekdays database created successfully');
        }).catchError((error) {
          print('error on create weekdays database ${error.toString()}');
        });
      },
      onOpen: (database){
        print('database opened successfully');
        getDataFromDatabase(database);
      }
    );
  }

  insertDataIntoDatabase(
  {
    required String missionName,
    required String ?missionTime
  })async{
    await database?.transaction((txn) {
      return txn.rawInsert(
          'INSERT INTO weekdaysdb (missionName,missionTime) VALUES'
              '("$missionName","$missionTime")');
    }).then((value) {
      print('data insert successfully inside weekdays database');
      getDataFromDatabase(database);
    }).catchError((error){
      print ('error on inserting data into weekdays database ${error.toString()}');
    });
  }

  getDataFromDatabase(database)async{
 await database?.rawQuery('SELECT * FROM weekdaysdb').then((value) {
   print(value.toString());

 }).catchError((error){
   print('error on get data from weekdays database ${error.toString()}');
 });
  }
}
