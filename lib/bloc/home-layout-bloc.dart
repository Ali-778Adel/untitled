import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/ui-screens/google-maps-screen.dart';
import 'package:untitled/ui-screens/homelayout-sub-screens/done-missions-screen.dart';

import '../ui-screens/homelayout-sub-screens/archieved-missions-screen.dart';
import '../ui-screens/homelayout-sub-screens/daily-missions-screen.dart';
import '../ui-screens/homelayout-sub-screens/home-sceen.dart';
import '../ui-screens/homelayout-sub-screens/your-network-screen.dart';
import '../ui-screens/test-screen.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutCubitStates> {
  HomeLayoutCubit() : super(HSInitState());
  static HomeLayoutCubit get(context) => BlocProvider.of(context);
  var scaffoldKey=GlobalKey<ScaffoldState>();

  List<Widget> relatedTabBarWidgets = [
       HomePageScreen(),
     DailyMissionScreen(),
     const DoneMissionScreen(),
     const ArchivedMissionScreen(),
     const Scaffold(
      body: Center(child: Text('fourth')),
    ),
     const UserNetworkScreen(),
     GoogleMapsScreen()
  ];
  int tbCurrentIndex = 0;
  void onTabBarItemTapped(
      {int? index, BuildContext? context}) {
    tbCurrentIndex = index!;
    print(tbCurrentIndex);
    emit(OnTapBarTappedState());
  }

  double? value = 0;
  onDrawerButtonTapped() {
    value == 0 ? value = 1 : value = 0;
    emit(OnDrawerButtonTappedState());
  }
}

abstract class HomeLayoutCubitStates {}

class HSInitState extends HomeLayoutCubitStates {}

class OnTapBarTappedState extends HomeLayoutCubitStates{}

class OnDrawerButtonTappedState extends HomeLayoutCubitStates {}


