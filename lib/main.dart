import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:untitled/bloc/daily-mission-bloc/daily-missions-cubit.dart';
import 'package:untitled/bloc/home-layout-bloc.dart';
import 'package:untitled/bloc/home-page-bloc/weekdays-missions-cubit.dart';
import 'package:untitled/bloc/mission-category-bloc/mission-category-cubit.dart';
import 'package:untitled/test/week-days-missions-bloc.dart';
import 'package:untitled/test/week-days-missions-screen.dart';
import 'package:untitled/ui-screens/hom-layout.dart';
import 'package:untitled/ui-screens/login-screen.dart';
import 'package:untitled/ui-screens/onboarding-screen.dart';
import 'package:untitled/ui-screens/test-screen.dart';
import 'bloc/google-maps-cubit/google-maps-cubit.dart';
import 'constants/Bloc_Observer.dart';
import 'constants/app-theme.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  GestureBinding.instance?.resamplingEnabled=true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeLayoutCubit()),
          BlocProvider(create: (context) => DailyMissionsCubit()),
          BlocProvider(create: (context) => WeekDaysMissionsCubit()..createWeekdaysDatabase()),
          BlocProvider(create: (context) => MissionCategoryCubit()..onCategoryScreenLaunch()),
          BlocProvider(create: (context) => GoogleMapsCubit()..getLocation()),
        ],
        child: Material(
          child: NeumorphicApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              home: const HomeLayout()),
        ));
  }
}
