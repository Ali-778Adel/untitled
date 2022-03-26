// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:untitled/test/week-days-missions-bloc.dart';
// import 'custom_week-days-listview-item.dart';
// class WeekdaysMissionsScreen extends StatelessWidget {
//
//   const WeekdaysMissionsScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return
//         ListView.builder(
//             itemCount: 7,
//             itemBuilder: (context,index){
//           return BlocBuilder<WeekDaysMissionsCubit,WeekDaysMissionsStates>(builder: (context,state){
//             context.read<WeekDaysMissionsCubit>().context=context;
//             return WeekdaysListviewItem(
//               weekdaysListTileModel: context.read<WeekDaysMissionsCubit>().listTileItems[index],
//             );
//           });
//         });
//   }
// }
