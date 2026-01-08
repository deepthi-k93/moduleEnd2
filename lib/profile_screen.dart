import 'package:flutter/material.dart';
import 'package:module2_end_assignment/custom_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(80), child: CustomAppBar()),
      body: Text("Profile",style: TextStyle(color: Colors.purple),),
    );
  }
}
