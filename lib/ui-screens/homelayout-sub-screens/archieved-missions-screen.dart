import 'package:flutter_neumorphic/flutter_neumorphic.dart';
class ArchivedMissionScreen extends StatelessWidget {
  const ArchivedMissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        child:const Text.rich(
          TextSpan(
            text:
            "done missions screen provide you feedback about missions that aren't important in the current time and you  want to archive it.",
            style:  TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.grey),
          ),
          style:  TextStyle(height: 1.5, fontSize: 18),
        )

    );}
}
