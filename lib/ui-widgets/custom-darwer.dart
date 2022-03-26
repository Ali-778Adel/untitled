import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
 const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 200,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.black12, Colors.grey, Colors.black12],
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
            )),
          ),
          SafeArea(
              child: Container(
                width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DrawerHeader(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      radius: 50,
                      child: Icon(
                        Icons.person_outline,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Ali Adel',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                )),
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(0.8),
                    children:  [
                      ListTile(
                        onTap: (){},
                        leading:const Icon(
                          Icons.home,
                          color: Colors.white,
                          size: 18,
                        ),
                        title:const Text(
                          'Home',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        subtitle:const Text(
                          'go to hme page',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                      ListTile(
                        onTap: (){},
                        leading:const Icon(
                          Icons.person_outline,
                          color: Colors.white,
                          size: 18,
                        ),
                        title:const Text(
                          'Home',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        subtitle:const Text(
                          'go to hme page',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                      ListTile(
                        onTap: (){},
                        leading:const Icon(
                          Icons.settings_outlined,
                          color: Colors.white,
                          size: 18,
                        ),
                        title:const Text(
                          'Home',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        subtitle:const Text(
                          'go to hme page',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                      ListTile(
                        onTap: (){},
                        leading:const Icon(
                          Icons.logout,
                          color: Colors.white,
                          size: 18,
                        ),
                        title:const Text(
                          'Home',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        subtitle:const Text(
                          'go to hme page',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
