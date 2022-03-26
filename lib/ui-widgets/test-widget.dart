import 'package:clay_containers/clay_containers.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:untitled/components/neu-icon.dart';
import 'package:untitled/components/neu-text.dart';
import 'package:untitled/constants/constants.dart';
import 'package:untitled/models/week-days-expansion-tile-model.dart';
import 'package:untitled/models/weekdays-missions-model.dart';
import 'package:untitled/ui-widgets/custom-week-days-missions-widget.dart';

class CustomExpansionListTile extends StatelessWidget {
  final WeekDayExpansionTileModel weekDayExpansionTileModel;
  final Widget? widget;
  const CustomExpansionListTile(
      {Key? key, required this.widget, required this.weekDayExpansionTileModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.only(left: 1),
      title: PublicNeumoText(
        text: weekDayExpansionTileModel.title,
        size: 18,
        color: Colors.black,
        align: TextAlign.start,
      ),
      children: [
        Stack(
          children: [
            widget!,
            const SizedBox(
              height: 140,
            ),
            Positioned(
                bottom: 5,
                right: 5,
                child: ClayContainer(
                  height: 70,
                  width: 70,
                  color: onBoardingTextColor.withOpacity(.1),
                  depth: 10,
                  spread: 0,
                  borderRadius: 35,
                  child: IconButton(
                    iconSize: 52,
                    color: onBoardingTextColor,
                    icon: PublicNeumoIcon(
                      iconData: Icons.add,
                      size: 32,
                      iconColor: Colors.yellow,
                    ),
                    onPressed: weekDayExpansionTileModel.onAddIconTapped,
                  ),
                ))
          ],
        ),
        //
      ],
    );
  }
}
class CustomExpansionListTile1 extends StatelessWidget {
  final WeekDayExpansionTileModel weekDayExpansionTileModel;
  // final Widget? widget;
  const CustomExpansionListTile1(
      {Key? key,  required this.weekDayExpansionTileModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.only(left: 1),
      leading: IconButton(
        color: Colors.black,
        alignment: Alignment.topLeft,
        icon: PublicNeumoIcon(
          iconData: Icons.add,
          iconColor: onBoardingTextColor,
          size: 18,
        ),
        onPressed: weekDayExpansionTileModel.onAddIconTapped,
      ),
      title: PublicNeumoText(
        text: weekDayExpansionTileModel.title,
        size: 18,
        color: Colors.black,
        align: TextAlign.start,
      ),
      children:  List.generate(
              weekDayExpansionTileModel.weekDayMissionModel!.length,
              (index) => CustomWeekDaysMissionsWidgets(
                  weekDayMissionModel:
                      weekDayExpansionTileModel.weekDayMissionModel![index])),



    );
  }
}
class CustomExpansionListTile2 extends StatelessWidget {
  // final Widget? widget;
 final String?title;
 final  Function()?onAddIconTapped;
 final List<WeekDayMissionModel>?weekDayMissionModel;
  const CustomExpansionListTile2(
      {Key? key,
      this.title,
      this.onAddIconTapped,
      this.weekDayMissionModel,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.only(left: 1),
      leading: IconButton(
        key:ValueKey(title) ,
        color: Colors.black,
        alignment: Alignment.topLeft,
        icon: PublicNeumoIcon(
          iconData: Icons.add,
          iconColor: onBoardingTextColor,
          size: 18,
        ),
        onPressed: onAddIconTapped,
      ),
      title: PublicNeumoText(
        text: title,
        size: 18,
        color: Colors.black,
        align: TextAlign.start,
      ),
      children:  List.generate(
         weekDayMissionModel!.length,
              (index) => CustomWeekDaysMissionsWidgets(
              weekDayMissionModel:
              weekDayMissionModel![index])),



    );
  }
}



