import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:module2_end_assignment/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.title});
  final String title;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    home();
  }

  void home() {
    Timer(Duration(seconds: 10), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage(title: widget.title)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.white,
            body: 
            Padding(
        padding: EdgeInsets.all(20),
        child: Center(child: Image.asset("images/of_logo.jpg",fit: BoxFit.fill,width: double.infinity,)),
      ),
  /*          IndexedStack(
              index: currentIndex,
              children: [
                HomePage(title: widget.title),
                ProfileScreen(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
              },

              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],

              /* Padding(
              padding: EdgeInsets.all(20),
              child: Center(child: Image.asset("images/of_logo.jpg")),
            ),*/
            ),
  */        ),
        );
      },
    );
  }
}
