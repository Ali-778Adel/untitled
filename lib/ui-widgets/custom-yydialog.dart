
import 'package:flutter/cupertino.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:untitled/components/neu-tadbar-container.dart';
import 'package:untitled/components/neu-text.dart';
class CustomYYRepeatDialogDialog extends StatelessWidget {
  const CustomYYRepeatDialogDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         PublicNeumorContainer(
           margin: const EdgeInsets.only(bottom: 20),
           height: 40,
           width:double.infinity ,
           child:const Center(
             child:  PublicNeumoText(
                text: 'Select Repeat method for this mission ',
               color: Colors.black,
               size: 16,
              ),
           ),
         ),
          Row(
            children: [
              Expanded(child:    RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                constraints:const BoxConstraints(minHeight: 60,maxWidth: 80),
                fillColor: Colors.white,
                child:const PublicNeumoText(
                  text: 'Daily',
                  size: 16,
                  color: Colors.black,
                ),
                padding:const EdgeInsets.all(5.0),
                shape:const CircleBorder(
                  side: BorderSide(width: 1, color: Colors.black, style: BorderStyle.solid),
                ),
              )),
              Expanded(child:    RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                constraints:const BoxConstraints(minHeight: 60,maxWidth: 80),

                fillColor: Colors.white,
                child:const PublicNeumoText(
                  text: 'Daily',
                  size: 16,
                  color: Colors.black,
                ),
                padding:const EdgeInsets.all(5.0),
                shape:const CircleBorder(
                  side: BorderSide(width: 1, color: Colors.black, style: BorderStyle.solid),
                ),
              )),
              Expanded(child:    RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                constraints:const BoxConstraints(minHeight: 60,maxWidth: 80),

                fillColor: Colors.white,
                child:const PublicNeumoText(
                  text: 'Daily',
                  size: 16,
                  color: Colors.black,
                ),
                padding:const EdgeInsets.all(5.0),
                shape:const CircleBorder(
                  side: BorderSide(width: 1, color: Colors.black, style: BorderStyle.solid),
                ),
              )),
              Expanded(child:    RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                constraints:const BoxConstraints(minHeight: 60,maxWidth: 80),

                fillColor: Colors.white,
                child:const PublicNeumoText(
                  text: 'Daily',
                  size: 16,
                  color: Colors.black,
                ),
                padding:const EdgeInsets.all(5.0),
                shape:const CircleBorder(
                  side: BorderSide(width: 1, color: Colors.black, style: BorderStyle.solid),
                ),
              )),

            ],
          )
        ],
      ),
    );
  }
}
