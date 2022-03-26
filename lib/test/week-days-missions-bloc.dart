// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:untitled/components/show_modal_bottomsheet.dart';
// import 'package:untitled/test/week-days-missions-bottomsheet.dart';
// import 'package:untitled/test/week-days-missions-model.dart';
// import 'package:untitled/test/weekdays-listTile-model.dart';
//
// class WeekDaysMissionsCubit extends Cubit<WeekDaysMissionsStates>{
//   WeekDaysMissionsCubit() : super(WDMSInitState());
// static WeekDaysMissionsCubit get(context)=>BlocProvider.of(context);
// var missionNameController =TextEditingController();
//
//   Map<String,String>timeButtonTextList={
//     'Saturday':'set Time',
//     'Sunday':'set Time',
//     'Monday':'set Time',
//     'Tuesday':'set Time',
//     'Wednesday':'set Time',
//     'Thursday':'set Time',
//     'Friday':'set Time',
//   };
//   Map<String,List<WeekDaysMissionsModel>>weekdaysMissionsList={
//     'Saturday':[],
//     'Sunday':[],
//     'Monday':[],
//     'Tuesday':[],
//     'Wednesday':[],
//     'Thursday':[],
//     'Friday':[],
//   };
//
// BuildContext?context;
//   List<String> getDaysOfWeek([String? locale]) {
//     final now = DateTime.now();
//     final firstDayOfWeek = now;
//     return List.generate(7, (index) => index)
//         .map((value) => DateFormat(DateFormat.WEEKDAY, locale)
//         .format(firstDayOfWeek.add(Duration(days: value))))
//         .toList();
//   }
//   List<String>? _daysOfWeek;
//   List<String> get daysOfWeek {
//     _daysOfWeek ??= getDaysOfWeek();
//     return _daysOfWeek!;
//   }
//
//   List<WeekdaysListTileModel>generateListTileItems(){
//   return List.generate(7, (index) => WeekdaysListTileModel(
//     weekdayName: daysOfWeek[index],
//     weekDaysMissionsModel:weekdaysMissionsList[daysOfWeek[index]],
//       onListTileAddButtonTapped: (){
//       onListTileAddButtonTapped(context: context!,index: index);
//       }
//   ));}
//   List<WeekdaysListTileModel> get listTileItems{
//     return generateListTileItems();
//   }
//   onListTileAddButtonTapped({required BuildContext context,int?index}){
//     showBarModalBottomsheet(
//         context: context,
//         widget:CustomWeekdaysBottomsheet3(
//           weekDayMissionController: missionNameController,
//           headerText:listTileItems[index!].weekdayName,
//           // setTimeButtonText: timeText1,
//           onSetTimeButtonTapped: (){
//             onSetTimeTapped(index: index);
//           },
//           onDoneBottomTapped: (){
//             onAddButtonTapped(index: index);
//           },
//         ));
//     emit(OnAddListTileButtonTappedState());
//   }
//   onSetTimeTapped({BuildContext?ctx, int?index}){
//    showTimePicker(context: context!, initialTime:TimeOfDay.now()).then((value) {
//      switch(listTileItems[index!].weekdayName){
//        case 'Saturday':{
//          timeButtonTextList['Saturday']=value!.format(context!).toString();
//      }break;
//        case 'Sunday':{
//          timeButtonTextList['Sunday']=value!.format(context!).toString();
//        }break;
//        case 'Monday':{
//          timeButtonTextList['Monday']=value!.format(context!).toString();
//        }break;
//        case 'Tuesday':{
//          timeButtonTextList['Tuesday']=value!.format(context!).toString();
//        }break;
//        case 'Wednesday':{
//          timeButtonTextList['Wednesday']=value!.format(context!).toString();
//        }break;
//        case 'Thursday':{
//          timeButtonTextList['Thursday']=value!.format(context!).toString();
//        }break;
//        case 'Friday':{
//          timeButtonTextList['Friday']=value!.format(context!).toString();
//        }break;
//      }
//      emit(OnSetTimeButtonTappedState());
//    });
//   }
//
//   onAddButtonTapped({int?index}){
//    weekdaysMissionsList[daysOfWeek[index!]]?.add(WeekDaysMissionsModel(
//    missionName: missionNameController.text,
//    missionTime: timeButtonTextList[daysOfWeek[index]]
//    ));
//  emit(OnAddButtonTappedState());
//  }}
// class WeekDaysMissionsStates{}
// class WDMSInitState extends WeekDaysMissionsStates{}
// class OnAddListTileButtonTappedState extends WeekDaysMissionsStates{}
// class OnSetTimeButtonTappedState extends WeekDaysMissionsStates{}
// class OnAddButtonTappedState extends WeekDaysMissionsStates{}