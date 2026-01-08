import 'package:flutter/material.dart';
import 'package:module2_end_assignment/cart_screen.dart';
import 'package:module2_end_assignment/wishlist_screen.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(66, 66, 66, 1),
      actionsPadding: EdgeInsets.symmetric(horizontal: 16.0),
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.menu, color: Colors.white),
      ),
      title:Image.asset("images/logo_white.png") ,
      /*TextButton.icon(
        onPressed: () {},
        label: Image.asset("images/logo_white.png"),
      ),*/
      centerTitle: true,

      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartScreen()),
            );
          },
          icon: Icon(Icons.shopping_bag_outlined, color: Colors.white),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WishlistScreen()),
            );
          },
          icon: Icon(Icons.favorite_border_outlined, color: Colors.white),
        ),
      ],
    );
  }
}
