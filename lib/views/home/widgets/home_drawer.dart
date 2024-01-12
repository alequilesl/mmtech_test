import 'package:flutter/material.dart';

class HomeDrawer extends Drawer
{
  HomeDrawer({super.key}):super(child: Builder(
    builder: (context) {
      return ListView(
        padding: EdgeInsets.zero,
        children: [
        UserAccountsDrawerHeader(
          accountEmail: const Text('email@mmtech_solutions.com'),
          accountName: const Text('MMTech Solutions'),
          currentAccountPicture: InkWell(
            child: Hero(
              tag: 'userAvatar',
              child: Icon(Icons.account_circle, size: MediaQuery.of(context).size.width/6, color: Colors.white,),
            ),
          ),
          onDetailsPressed: (){

          },
          decoration: const BoxDecoration(
            color: Colors.deepPurple,
          ),

        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: ()=>Navigator.of(context).pop(),
        ),
        ListTile(
          leading: const Icon(Icons.picture_in_picture_alt),
          title: const Text('Disney'),
          onTap: ()=>Navigator.of(context).pop(),
        ),
        ListTile(
          leading: const Icon(Icons.query_stats),
          title: const Text('Chess Players'),
            onTap: ()=>Navigator.of(context).pop(),
          ),
      ],);
    }
  ));
}