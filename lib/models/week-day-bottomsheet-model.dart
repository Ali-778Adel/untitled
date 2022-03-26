import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WeekdaysBottomSheetModel{
   TextEditingController? weekDayMissionController;
   String?expansionTitle;
   String? headerText;
   String?setTimeButtonText;
   Function ()?onSetTimeButtonTapped;
   Function ()?onAddLocationTapped;
   Function()? onDoneBottomTapped;
   WeekdaysBottomSheetModel({
     this.expansionTitle,
     this.weekDayMissionController,
     this.headerText,
     this.setTimeButtonText,
     this.onSetTimeButtonTapped,
     this.onAddLocationTapped,
     this.onDoneBottomTapped,
   });
}
