import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:untitled/test/custom-listtile-listview-item.dart';
import 'package:untitled/test/weekdays-listTile-model.dart';

import '../components/neu-icon.dart';
import '../components/neu-text.dart';
import '../constants/constants.dart';
import '../models/weekdays-listTile-model.dart';
import 'custom-listtile-listview-item.dart';

class WeekdaysListviewItem extends StatelessWidget {
  final WeekdaysListTileModel? weekdaysListTileModel;
  const WeekdaysListviewItem({Key? key, this.weekdaysListTileModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        key: ValueKey(weekdaysListTileModel!.weekdayName),
        tilePadding: const EdgeInsets.only(left: 1),
        leading: IconButton(
          key: ValueKey(weekdaysListTileModel!.weekdayName),
          color: Colors.black,
          alignment: Alignment.topLeft,
          icon: PublicNeumoIcon(
            iconData: Icons.add,
            iconColor: onBoardingTextColor,
            size: 18,
          ),
          onPressed: weekdaysListTileModel!.onListTileAddButtonTapped,
        ),
        title: PublicNeumoText(
          text: weekdaysListTileModel!.weekdayName,
          size: 18,
          color: Colors.black,
          align: TextAlign.start,
        ),
        children: [
          if (weekdaysListTileModel!.weekDaysMissionsModel!.isEmpty)
            Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                child: Text.rich(TextSpan(
                    text: 'No tasks for ',
                    style:const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
                    children: [TextSpan(
                    text: weekdaysListTileModel!.weekdayName,
                  style:const TextStyle(color:Colors.red,fontSize: 20,fontWeight: FontWeight.w400)
                ),const TextSpan(
                  text: 'AddOneNow',
                    style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),

                )]))),
          if(weekdaysListTileModel!.weekDaysMissionsModel!.isNotEmpty)
            Column(children: List.generate(
                weekdaysListTileModel!.weekDaysMissionsModel!.length,
                    (index) => CustomListTileListViewItem(
                  weekDaysMissionsModel: weekdaysListTileModel!.weekDaysMissionsModel![index],
                )), )

        ]);
  }
}
