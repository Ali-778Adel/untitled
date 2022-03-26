import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../bloc/home-layout-bloc.dart';
import '../ui-widgets/custom-app-bar.dart';
import '../ui-widgets/custom-darwer.dart';
import '../ui-widgets/custom-tab-bar.dart';
class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TabController ?tabController;
    return  Stack(
      children: [
        const CustomDrawer(),
        BlocBuilder<HomeLayoutCubit,HomeLayoutCubitStates>(
            builder: (context, state) {
              HomeLayoutCubit homLayoutCubit=HomeLayoutCubit.get(context);

              return TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: homLayoutCubit.value),
                  duration: const Duration(milliseconds: 300),
                  builder: (context, double val, _) {
                    return Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..setEntry(0, 3, 180 * val)
                        ..rotateY((pi / 6) * val),
                      child:  DefaultTabController(
                          initialIndex:homLayoutCubit.tbCurrentIndex,
                          length: homLayoutCubit.relatedTabBarWidgets.length ,
                          child:   Scaffold(
                            key:homLayoutCubit.scaffoldKey,
                            appBar: PreferredSize(
                              preferredSize: Size(MediaQuery.of(context).size.width,120),
                              child: CustomAppBar(
                                title: 'Mission Man ',
                                bottom: CustomTabBar(
                                  tabController: tabController,
                                  function:(int? index)=>homLayoutCubit.onTabBarItemTapped(index: index),

                                ),
                              ),
                            ),
                            body: TabBarView(
                                physics:const NeverScrollableScrollPhysics(),
                                controller: tabController,
                                children: context.read<HomeLayoutCubit>().relatedTabBarWidgets),
                            drawer: InkWell(
                                onTap: homLayoutCubit.onDrawerButtonTapped
                            ),
                          )),);




                  });
            }
        ),


      ],
    );
  }
}
// TabBarView(children: context.read<HomeLayoutCubit>().relatedTabBarWidgets);
// PreferredSize(
// preferredSize:const Size(double.infinity,160),
// child: CustomAppBar(title: 'Dementia',
// bottom: BlocBuilder<HomeLayoutCubit,HomeLayoutCubitStates>(
// builder: (context, state) {
// return CustomTabBar(
// tabController: tabController,
// function: (index)=>context.read<HomeLayoutCubit>().onTabBarItemTapped(index: index,context: context,tabController: tabController),
// );
// }
// ),
// ),
//
// ),



