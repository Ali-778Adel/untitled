import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc/daily-mission-bloc/daily-missions-states.dart';
import 'package:untitled/models/mission-view-model.dart';

class DailyMissionsCubit extends Cubit<DailyMissionsStates> {
  DailyMissionsCubit() : super(DMInitState());
  static DailyMissionsCubit get(context) => BlocProvider.of(context);
  List<String> gridButtonsTexts = [
    'set Time',
    'Set Date',
    'repeat',
    'At Location'
  ];
  List<MissionViewModel>missionsItems=[];
  TextEditingController? missionController=TextEditingController();

  onsetTimeButtonTapped({required BuildContext context}) {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      gridButtonsTexts[0] = value!.format(context).toString();
      emit(OnSetTimeButtonTappedState());
    });
  }
  onsetDateButtonTapped({required BuildContext context}) {
    showDatePicker(context: context,
        firstDate:DateTime.now() ,
        initialDate: DateTime.now(),
      lastDate: DateTime.parse('2032-12-01')
    )
        .then((value) {
      gridButtonsTexts[1] = DateFormat.yMMMd( ).format( value! );
      emit(OnSetDateButtonTappedState());
    });
  }
  onRepeatButtonTapped({required BuildContext context,required Widget widget}){
    return widget;

  }
onBottomsheetDoneButtonTapped(){
    missionsItems.add(
      MissionViewModel(
        missionText: missionController!.text,
        missionTime:gridButtonsTexts[0],
        missionDate:gridButtonsTexts[1],
        missionLocation: gridButtonsTexts[0],
        missionRepeat: gridButtonsTexts[1],
      )
    );
    emit(OnBottomSheetDoneButtonTappedState());

}
}
