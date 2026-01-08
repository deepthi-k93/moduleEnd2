import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:module2_end_assignment/products_listing_screen.dart';
import 'package:module2_end_assignment/profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  List wishlistItems = [];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          ProductsListingScreen(title: widget.title),
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
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],

        /* Padding(
              padding: EdgeInsets.all(20),
              child: Center(child: Image.asset("images/of_logo.jpg")),
            ),*/
      ),
    );
  }
}

Widget categoryCard(String categoryName) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    height: 32.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.r),
      border: Border.all(color: Color(0xffDEDEDE)),
    ),
    child: Row(
      children: [
        Text(categoryName, style: TextStyle(fontSize: 16)),
        SizedBox(width: 5),
        Icon(Icons.close, size: 20),
      ],
    ),
  );
}
