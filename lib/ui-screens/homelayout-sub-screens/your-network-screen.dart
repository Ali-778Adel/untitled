import 'package:flutter_neumorphic/flutter_neumorphic.dart';
class UserNetworkScreen extends StatelessWidget {
  const UserNetworkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        child:const Text.rich(
          TextSpan(
            text:
            'Network Screen provide you feedback about contacts that you want share your location continuously via WhatsApp Application   ',
            style:  TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.grey),
          ),
          style:  TextStyle(height: 1.5, fontSize: 18),
        )

    );}
}
