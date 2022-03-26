// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:untitled/bloc/home-page-bloc/weekdays-missions-cubit.dart';
// import 'package:untitled/components/neu-text.dart';
// import 'package:untitled/components/show_modal_bottomsheet.dart';
// import 'package:untitled/constants/constants.dart';
// import 'package:untitled/models/week-day-bottomsheet-model.dart';
// import 'package:untitled/models/week-days-expansion-tile-model.dart';
// import 'package:untitled/models/weekdays-missions-model.dart';
// import 'package:untitled/ui-widgets/custom-week-days-bottomsheet.dart';
// import 'package:untitled/ui-widgets/custom-week-days-missions-widget.dart';
//
// import '../../bloc/home-page-bloc/weekdays-missions-states.dart';
// import '../../ui-widgets/test-widget.dart';
//
// class HomePageScreen extends StatelessWidget {
//   const HomePageScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget   build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         Container(
//           margin: const EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 10),
//           child:const PublicNeumoText(
//             text: 'All Weekdays Missions',
//             size: 20,
//             color: mainColor,
//             align: TextAlign.start,
//           ),
//         ),
//         Flexible(
//           child: Container(
//             margin: const EdgeInsets.only(left:20,right: 0),
//             child:  ListView.builder(
//               itemCount: 7 ,
//               physics: const AlwaysScrollableScrollPhysics(),
//               shrinkWrap: true ,
//               itemBuilder: (context, i) {
//                 return BlocBuilder<HomePageCubit,HomePageStates>(
//                     builder: (context, state) {
//                       HomePageCubit homePageCubit=HomePageCubit.get(context);
//                       return CustomExpansionListTile(
//                           widget:ListView.builder(
//                               physics:const BouncingScrollPhysics(),
//                               scrollDirection: Axis.vertical,
//                               itemCount:homePageCubit.weekdaymissionsList.length,
//                               shrinkWrap: true,
//                               itemBuilder: (context,index){
//                                 if(homePageCubit.weekdaymissionsList.isNotEmpty) {
//                                   return Scaffold();
//                                     // CustomWeekDaysMissionsWidgets(weekDayMissionModel:homePageCubit.weekdaymissionsList[index],);
//                                 }else {
//                                   return CustomWeekDaysMissionsWidgets(weekDayMissionModel: WeekDayMissionModel(missionText: 'no mission fo ${homePageCubit.daysOfWeek[i]} yet',missionTime: '12:30 Am'));
//                                 }
//                               }
//                           ),
//                           weekDayExpansionTileModel:WeekDayExpansionTileModel(
//                               title: homePageCubit.daysOfWeek[i],
//                               onAddIconTapped: (){
//                                 showBarModalBottomsheet(context: context,
//                                     widget: CustomWeekdaysBottomsheet(
//                                         weekdaysBottomSheetModel: WeekdaysBottomSheetModel(
//                                             headerText: homePageCubit.daysOfWeek[i],
//                                             weekDayMissionController: homePageCubit.missionController,
//                                             onDoneBottomTapped: (){
//                                               homePageCubit.onDoneButtonTapped(index: i);
//                                             }
//                                         )));
//                               }
//                           ));
//
//                     }
//                 );
//               },
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
