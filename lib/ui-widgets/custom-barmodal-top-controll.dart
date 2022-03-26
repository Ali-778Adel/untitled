import 'package:flutter_neumorphic/flutter_neumorphic.dart';
class CustomBarModalControl extends StatelessWidget {
  const CustomBarModalControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      width: double.infinity,
      child: Row(
        children: [
        TextButton(child:  Text('Task Details'),onPressed: (){},),
        Spacer(),
        TextButton(onPressed: (){}, child: Text('save'))
        ],
      ),
    );
  }
}
