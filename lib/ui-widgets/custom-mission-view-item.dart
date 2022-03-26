import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:untitled/components/neu-text.dart';
import 'package:untitled/constants/constants.dart';
import 'package:untitled/models/mission-view-model.dart';

import '../components/neu-button.dart';
class CustomMissionViewItem extends StatelessWidget {
final  MissionViewModel missionViewModel;
  const CustomMissionViewItem({Key? key,required this.missionViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: baseColor,
      margin: const EdgeInsets.only(top: 20,bottom: 20),
      child: ClayContainer(
        depth: 30,
        width: MediaQuery.of(context).size.width*90,
        color: baseColor,
        spread: 20
        ,
        borderRadius: 7.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: PublicNeumoText(
                  text: missionViewModel.missionText,
                  color: Colors.black,
                  size: 22,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(child: CustomBottomSheetButton(
                  textColor: Colors.black,
                  borderColor: Colors.black,
                  text: missionViewModel.missionTime,
                  shadowDarkColor: Colors.black,
                  function: (){},
                ),),
                Expanded(child: CustomBottomSheetButton(
                  textColor: Colors.black,
                  borderColor: Colors.black,
                  text: missionViewModel.missionDate,
                  shadowDarkColor: Colors.black,
                  function: (){},
                ),),
              ],
            ),
            const SizedBox(
              height: 5,

            ),
            Row(
              children: [
                Expanded(child: CustomBottomSheetButton(
                  textColor: Colors.black,
                  borderColor: Colors.black,
                  text: missionViewModel.missionTime,
                  shadowDarkColor: Colors.black,
                  function: (){},
                ),),
                Expanded(child: CustomBottomSheetButton(
                  textColor: Colors.black,
                  borderColor: Colors.black,
                  text: missionViewModel.missionDate,
                  shadowDarkColor: Colors.black,
                  function: (){},
                ),),
              ],
            ),

          ],
        ),


      ),
    );
  }
}
