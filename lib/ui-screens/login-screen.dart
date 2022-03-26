import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/components/neu-button.dart';
import 'package:untitled/components/neu-text.dart';
import 'package:untitled/constants/constants.dart';
import 'package:untitled/ui-screens/hom-layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
        child: Column(

          children: [
            SvgPicture.asset(
              'assets/login-images/profile.svg',
              fit: BoxFit.contain,
              height: 350,
              width: MediaQuery.of(context).size.width * 0.99,
            ),
            const SizedBox(
              height: 10,
            ),
            const Spacer(),
            const Center(
              child: PublicNeumoText(
                text: 'Login to help us identifying you. ',
                size: 16,
                color: onBoardingTextColor,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const CustomNeumorphicButton(
              iconAssetsPath: 'assets/login-images/google.png',
              text: 'Login with google',
              buttonBackgroundColor: onBoardingTextColor,
            ),
            const SizedBox(
              height: 20,
            ),
             CustomNeumorphicButton(
              iconAssetsPath: 'assets/login-images/facebook .png',
              text: 'Login with Fcaebook',
              buttonBackgroundColor: facebookBackGColor,
              function: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeLayout()));
              },
            ),
            const SizedBox(
              height: 20,
            ),

            const PublicNeumoText(
              text: 'why i need to login ?',
              color: onBoardingTextColor,
              size: 12,
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text.rich(
                TextSpan(
                    text:
                        'by using mission man app you accept our Terms of Service and Privacy Policy',
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                    children: [
                      TextSpan(
                          text: 'Terms of Service',
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.underline,
                              color: Colors.black),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Scaffold(
                                            appBar: AppBar(
                                              title: const Text(
                                                  'Terms of Service'),
                                            ),
                                          )));
                            }),
                      const TextSpan(
                        text: ' and ',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                      ),
                      TextSpan(
                          text: 'Privacy Policy',
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Scaffold(
                                            appBar: AppBar(
                                              title:
                                                  const Text('privacy policy'),
                                            ),
                                          )));
                            }),
                    ]),
                style: const TextStyle(height: 1.5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
