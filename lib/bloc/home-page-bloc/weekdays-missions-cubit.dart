import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/components/show_modal_bottomsheet.dart';
import '../../models/week-days-missions-model.dart';
import '../../models/weekdays-listTile-model.dart';
import '../../ui-widgets/custom-week-days-bottomsheet.dart';

class WeekDaysMissionsCubit extends Cubit<WeekDaysMissionsStates> {
  WeekDaysMissionsCubit() : super(WDMSInitState());
  static WeekDaysMissionsCubit get(context) => BlocProvider.of(context);
  var missionNameController = TextEditingController();

  Map<String, String> timeButtonTextList = {
    'Saturday': 'set Time',
    'Sunday': 'set Time',
    'Monday': 'set Time',
    'Tuesday': 'set Time',
    'Wednesday': 'set Time',
    'Thursday': 'set Time',
    'Friday': 'set Time',
  };
  Map<String, List<WeekDaysMissionsModel>> ?weekdaysMissionsList;

  BuildContext? context;
  List<String> getDaysOfWeek([String? locale]) {
    final now = DateTime.now();
    final firstDayOfWeek = now;
    return List.generate(7, (index) => index)
        .map((value) => DateFormat(DateFormat.WEEKDAY, locale)
            .format(firstDayOfWeek.add(Duration(days: value))))
        .toList();
  }

  List<String>? _daysOfWeek;
  List<String> get daysOfWeek {
    _daysOfWeek ??= getDaysOfWeek();
    return _daysOfWeek!;
  }

  List<WeekdaysListTileModel> generateListTileItems() {
    return List.generate(
        7,
        (index) => WeekdaysListTileModel(
            weekdayName: daysOfWeek[index],
            weekDaysMissionsModel: weekdaysMissionsList![daysOfWeek[index]],
            onListTileAddButtonTapped: () {
              onListTileAddButtonTapped(context: context!, index: index);
            }));
  }

  List<WeekdaysListTileModel> get listTileItems {
    return generateListTileItems();
  }

  onListTileAddButtonTapped({required BuildContext context, int? index}) {
    showBarModalBottomsheet(
        context: context,
        widget: CustomWeekdaysBottomsheet(
          weekDayMissionController: missionNameController,
          headerText: listTileItems[index!].weekdayName,
          // setTimeButtonText: timeText1,
          onSetTimeButtonTapped: () {
            onSetTimeTapped(index: index);
          },
          onDoneBottomTapped: () {
            onDoneButtonTapped(index: index);
          },
        ));
    emit(OnAddListTileButtonTappedState());
  }

  onSetTimeTapped({BuildContext? ctx, int? index}) {
    showTimePicker(context: context!, initialTime: TimeOfDay.now())
        .then((value) {
      switch (listTileItems[index!].weekdayName) {
        case 'Saturday':
          {
            timeButtonTextList['Saturday'] = value!.format(context!).toString();
          }
          break;
        case 'Sunday':
          {
            timeButtonTextList['Sunday'] = value!.format(context!).toString();
          }
          break;
        case 'Monday':
          {
            timeButtonTextList['Monday'] = value!.format(context!).toString();
          }
          break;
        case 'Tuesday':
          {
            timeButtonTextList['Tuesday'] = value!.format(context!).toString();
          }
          break;
        case 'Wednesday':
          {
            timeButtonTextList['Wednesday'] =
                value!.format(context!).toString();
          }
          break;
        case 'Thursday':
          {
            timeButtonTextList['Thursday'] = value!.format(context!).toString();
          }
          break;
        case 'Friday':
          {
            timeButtonTextList['Friday'] = value!.format(context!).toString();
          }
          break;
      }
      emit(OnSetTimeButtonTappedState());
    });
  }

  onDoneButtonTapped({int? index}) {
    insertDataIntoDatabase(
        missionName: missionNameController.text,
        missionTime: timeButtonTextList[daysOfWeek[index!]],
        index: index);
    Navigator.pop(context!);
    emit(OnAddButtonTappedState());
  }

  Database? database;
  void createWeekdaysDatabase() async {
    database = await openDatabase('weekdays.dbase', version: 1,
        onCreate: (database, version) {
      database
          .execute('CREATE TABLE weekdaysdb('
              'id INTEGER PRIMARY KEY,'
              'missionName TEXT,'
              'missionTime TEXT,'
              'missionDay TEXT,'
              'missionLocationName TEXT,'
              'missionDate TEXT,'
              'missionDescription TEXT)')
          .then((value) {
        print('Weekdays database created successfully');
      }).catchError((error) {
        print('error on create weekdays database ${error.toString()}');
      });

    }, onOpen: (database) {
      print('weekDatabase opened successfully');
      getDataFromDatabase(database);
      emit(OpenDatabaseState());
    });
  }

  insertDataIntoDatabase(
      {String? missionName, String? missionTime, required int index}) async {
    // String day = daysOfWeek[index];
    await database!.transaction((txn) {
      return txn.rawInsert(
          'INSERT INTO weekdaysdb (missionName,missionTime,missionDay) VALUES'
          '("$missionName"'
          ',"$missionTime",'
          '"${daysOfWeek[index]}")');
    }).then((value) {
      print('data insert successfully inside weekdays database');
    }).catchError((error) {
      print(
          'error on inserting data into weekdays database ${error.toString()}');
    });
    getDataFromDatabase(database);
emit(InsertIntoDatabaseState());
  }

  getDataFromDatabase(database) async {
  weekdaysMissionsList=  {
    'Saturday': [],
    'Sunday': [],
    'Monday': [],
    'Tuesday': [],
    'Wednesday': [],
    'Thursday': [],
    'Friday': [],
    };
    await database.rawQuery('SELECT * FROM weekdaysdb').then((value) {
      value.forEach((element) {
        switch (element['missionDay']) {
          case 'Saturday':
            {
              weekdaysMissionsList!['Saturday']!.add(WeekDaysMissionsModel(
                missionName: element['missionName'].toString(),
                missionTime: element['missionTime'].toString(),
              ));
            }
            break;
          case 'Sunday':
            {
              weekdaysMissionsList!['Sunday']!.add(WeekDaysMissionsModel(
                missionName: element['missionName'].toString(),
                missionTime: element['missionTime'].toString(),
              ));
            }
            break;
          case 'Monday':
            {
              weekdaysMissionsList!['Monday']!.add(WeekDaysMissionsModel(
                missionName: element['missionName'].toString(),
                missionTime: element['missionTime'].toString(),
              ));
            }
            break;
          case 'Tuesday':
            {
              weekdaysMissionsList!['Tuesday']!.add(WeekDaysMissionsModel(
                missionName: element['missionName'].toString(),
                missionTime: element['missionTime'].toString(),
              ));
            }
            break;
          case 'Wednesday':
            {
              weekdaysMissionsList!['Wednesday']!.add(WeekDaysMissionsModel(
                missionName: element['missionName'].toString(),
                missionTime: element['missionTime'].toString(),
              ));

            }
            break;
          case 'Thursday':
            {
              weekdaysMissionsList!['Thursday']!.add(WeekDaysMissionsModel(
                missionName: element['missionName'].toString(),
                missionTime: element['missionTime'].toString(),
              ));
              emit(GetDataFromDatabaseCreateDatabaseState());
            }
            break;

          case 'Friday':
            {
              weekdaysMissionsList!['Friday']!.add(WeekDaysMissionsModel(
                missionName: element['missionName'].toString(),
                missionTime: element['missionTime'].toString(),
              ));
            }
            break;
        }

      });
      print(value.toString());
    }).catchError((error) {
      print('error on get data from weekdays database ${error.toString()}');
    });
  }
}

class WeekDaysMissionsStates {}

class WDMSInitState extends WeekDaysMissionsStates {}

class OnAddListTileButtonTappedState extends WeekDaysMissionsStates {}

class OnSetTimeButtonTappedState extends WeekDaysMissionsStates {}

class OnAddButtonTappedState extends WeekDaysMissionsStates {}

class CreateDatabaseState extends WeekDaysMissionsStates {}

class OpenDatabaseState extends WeekDaysMissionsStates {}

class InsertIntoDatabaseState extends WeekDaysMissionsStates {}

class GetDataFromDatabaseCreateDatabaseState extends WeekDaysMissionsStates {}
