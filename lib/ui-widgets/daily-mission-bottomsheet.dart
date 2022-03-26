// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:untitled/bloc/daily-mission-bloc/daily-missions-cubit.dart';
import 'package:untitled/bloc/daily-mission-bloc/daily-missions-states.dart';
import 'package:untitled/constants/constants.dart';
import '../components/custom-yyrepeat-dialog.dart';
import '../components/neu-button.dart';
import '../components/neu-text.dart';
import 'custom-barmodal-top-controll.dart';

class MissionBottomSheet extends StatelessWidget {
  MissionBottomSheet(
      {Key? key,
      required this.missionController,
      required this.onDoneTappedFunction})
      : super(key: key);
  final TextEditingController missionController;
  final Function() onDoneTappedFunction;
  int? _value = 1;
  Map<String, dynamic> gridViewItemContent = {
    'setTimeItem': {
      'icon': const Icon(Icons.watch_later_outlined),
      'name': const Text('SetTime'),
      'onTap': Function,
    }
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.839,
          width: MediaQuery.of(context).size.width * 0.99,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: const BoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(height: 10,),
                Container(
                  child: const Center(child: CustomBarModalControl()),
                  width: double.infinity,
                  height: 60,
                  margin: const EdgeInsets.only(top: 20, bottom: 10),
                ),
                TextFormField(
                  controller: missionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                      hintText: ' I Want to .....',
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 22)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: const Text(
                    'Remind me about this ',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 140,
                  width: MediaQuery.of(context).size.width * .95,
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 5,
                              mainAxisExtent: 50),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return GridViewItem(
                          index: index,
                        );
                      }),
                ),
                // const SizedBox(height: 0,),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: const PublicNeumoText(
                    text: 'Lists',
                    color: Colors.black,
                    size: 14,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  child: DropdownButton(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      value: _value,
                      items: const [
                        DropdownMenuItem(
                          child: PublicNeumoText(
                            text: "personal",
                            size: 14,
                            color: Colors.black,
                          ),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: PublicNeumoText(
                            text: "work",
                            size: 14,
                            color: Colors.black,
                          ),
                          value: 2,
                        )
                      ],
                      onChanged: (int? value) {
                        _value = value;
                      },
                      hint: const Text("Select item")),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: const PublicNeumoText(
                    text: 'Add Notes',
                    color: Colors.black,
                    size: 14,
                  ),
                ),

                CustomBottomSheetButton(
                  width: MediaQuery.of(context).size.width * .95,
                  textColor: Colors.black,
                  borderColor: Colors.black,
                  text: 'Add Notes',
                  shadowDarkColor: Colors.black,
                  function: () {},
                ),

                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: const PublicNeumoText(
                    text: 'Add Attachments',
                    color: Colors.black,
                    size: 14,
                  ),
                ),
                const SizedBox(
                  height: 0,
                ),
                CustomBottomSheetButton(
                  width: MediaQuery.of(context).size.width * .95,
                  textColor: Colors.black,
                  borderColor: Colors.black,
                  text: 'Add Attachments',
                  shadowDarkColor: Colors.black,
                  function: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: const PublicNeumoText(
                    text: 'Delete this mission ',
                    color: Colors.black,
                    size: 14,
                  ),
                ),
                const SizedBox(
                  height: 0,
                ),
                CustomBottomSheetButton(
                  width: MediaQuery.of(context).size.width * .95,
                  textColor: Colors.red,
                  borderColor: Colors.red,
                  text: 'Delete Mission',
                  shadowDarkColor: Colors.red,
                  function: () {},
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 60,
          child: CustomNewMissionButton(
            width: double.infinity,
            text: 'Done',
            iconData: Icons.check_circle_outline_rounded,
            function: onDoneTappedFunction,
          ),
        )
      ],
    );
  }
}

class GridViewItem extends StatelessWidget {
  int? index;
  BuildContext? context;
  String? timeText;
  GridViewItem({Key? key, this.index, this.timeText}) : super(key: key);
  onTimeButtonTapped({BuildContext? context, String? text}) {
    Navigator.push(context!,
        MaterialWithModalsPageRoute(builder: (context) => Scaffold()));
  }

  List gridViewItemContent = [
    {
      'icon': Icons.watch_later_outlined,
      'name': 'set Time',
    },
    {
      'icon': Icons.calendar_today_sharp,
      'name': 'Set Date',
    },
    {
      'icon': Icons.repeat,
      'name': 'daily,weakly,....',
    },
    {
      'icon': Icons.location_on,
      'name': 'At Location',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyMissionsCubit, DailyMissionsStates>(
        builder: (context, snapshot) {
      DailyMissionsCubit cubit = DailyMissionsCubit.get(context);

      return CustomNewMissionButton(
          iconData: gridViewItemContent[index!]['icon'],
          text: cubit.gridButtonsTexts[index!],
          function: () {
            switch (index) {
              case 0:
                {
                  cubit.onsetTimeButtonTapped(context: context);
                }
                break;
              case 1:
                {
                  cubit.onsetDateButtonTapped(context: context);
                }
                break;
              case 2:
                {
                  CustomRepeatDialog(context);
                }
                break;
            }
          });
    });
  }
}
