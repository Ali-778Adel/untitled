import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:untitled/bloc/home-page-bloc/weekdays-missions-cubit.dart';
import 'package:untitled/components/neu-text.dart';
import 'package:untitled/constants/constants.dart';
import 'package:untitled/ui-widgets/custom-week-days-bottomsheet.dart';
import '../ui-widgets/custom_week-days-listview-item.dart';

class HomePageScreen extends StatelessWidget {
  CustomWeekdaysBottomsheet ?customWeekdaysBottomsheet;
   HomePageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          margin:
              const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 10),
          child: const PublicNeumoText(
            text: 'All Weekdays Missions',
            size: 20,
            color: mainColor,
            align: TextAlign.start,
          ),
        ),

        BlocBuilder<WeekDaysMissionsCubit,WeekDaysMissionsStates>(
          builder: (context, snapshot) {
            WeekDaysMissionsCubit weekdaysMissionsCubit=WeekDaysMissionsCubit.get(context);
            context.read<WeekDaysMissionsCubit>().context=context;
            if (weekdaysMissionsCubit.weekdaysMissionsList==null){
              return  const Center(child: CircularProgressIndicator(color: onBoardingTextColor,),);
            }else {
              return Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 0),
                child:ListView.builder(
                    itemCount: 7,
                    itemBuilder: (context,index){
                          return WeekdaysListviewItem(
                            weekdaysListTileModel: context
                                .read<WeekDaysMissionsCubit>()
                                .listTileItems[index],
                          );
                    })
              ),
            );
            }
          }
        )
      ],
    );
  }
}

