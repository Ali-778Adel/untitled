import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:untitled/bloc/daily-mission-bloc/daily-missions-cubit.dart';
import 'package:untitled/bloc/daily-mission-bloc/daily-missions-states.dart';
import 'package:untitled/components/neu-button.dart';
import 'package:untitled/ui-screens/homelayout-sub-screens/home-sceen.dart';
import 'package:untitled/ui-widgets/custom-mission-view-item.dart';
import 'package:untitled/ui-widgets/daily-mission-bottomsheet.dart';
import '../../models/mission-view-model.dart';
import '../test-screen.dart';

class DailyMissionScreen extends StatelessWidget {
  var missionController = TextEditingController();
  DailyMissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<DailyMissionsCubit,DailyMissionsStates>(
            builder: (context, snapshot) {
              DailyMissionsCubit dailyMissionsCubit=DailyMissionsCubit.get(context);
              if(dailyMissionsCubit.missionsItems.isEmpty) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  child: Text.rich(
                    TextSpan(
                        text:
                        'daily missions screen provide you feedback about missions or actions you do continuously do across day an all days   ',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                        children: [
                          const TextSpan(
                            text: ' or ',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          const TextSpan(
                            text: ' take medicine ,',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                          const TextSpan(
                            text: ' or ',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          const TextSpan(
                            text: 'go to gym',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          const TextSpan(
                            text: ' or ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          const TextSpan(
                            text: 'take your meals at specific time across day ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          const TextSpan(
                            text: ' or ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          const TextSpan(
                            text: 'Blood pressure measurement at specific times ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          const TextSpan(
                            text: ' or ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          const TextSpan(
                            text: 'Measuring the level of sugar in the blood ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          const TextSpan(
                            text:
                            'note that all missions or actions in this screen made continuously across all days if you want to make a mission just on time or at specific day you can put it in ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                              text: 'HomeScreen ',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePageScreen()));
                                }),
                        ]),
                    style: const TextStyle(height: 1.5, fontSize: 18),
                  ),
                );
              }else{
                return ListView.builder(
                    itemCount: dailyMissionsCubit.missionsItems.length,
                    itemExtent: 250,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top: 20,bottom: 20,right: 20,left: 10),
                    itemBuilder: (context,index){
                      return CustomMissionViewItem(missionViewModel: MissionViewModel(
                        missionText: dailyMissionsCubit.missionsItems[index].missionText,
                        missionTime: dailyMissionsCubit.missionsItems[index].missionTime,
                        missionDate: dailyMissionsCubit.missionsItems[index].missionDate,
                        missionRepeat: dailyMissionsCubit.missionsItems[index].missionTime,
                        missionLocation: dailyMissionsCubit.missionsItems[index].missionDate,
                      ),);
                    });
              }
            }
        ),

        Positioned(
          bottom: 20,
          right: 10,
          child: CustomNewMissionButton(
            width: MediaQuery.of(context).size.width*.60,
            text: 'Add new mission',
            iconData:Icons.add ,
            function: (){
              showBarModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  context: context,
                  builder: (context) {
                    return
                      BlocBuilder<DailyMissionsCubit,DailyMissionsStates>(
                          builder: (context, snapshot) {
                            DailyMissionsCubit dailyMissionsCubit=DailyMissionsCubit.get(context);
                            return MissionBottomSheet(
                              missionController:dailyMissionsCubit.missionController!,
                              onDoneTappedFunction: (){
                                dailyMissionsCubit.onBottomsheetDoneButtonTapped();
                              },
                            );
                          }
                      );

                  });
            },
          ),
        )
      ],
    );

  }
}
