import 'package:device_shop/screens/basket_page/cart_page.dart';
import 'package:device_shop/screens/home_page/home_page.dart';
import 'package:device_shop/screens/profile_page/profile_page.dart';
import 'package:device_shop/view_model/profile_view_model.dart';
import 'package:device_shop/view_model/tab_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabBox extends StatefulWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> screens = [];

  _printFCMToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    await Provider.of<ProfileViewModel>(context, listen: false).updateFCMToken(
        docId: 
        fcmToken: token.toString());
    print("FCM TOKEN : $token");
  }

  @override
  void initState() {
    screens.add(const HomePage());
    screens.add(const CartPage());
    screens.add(const ProfilePage());
    _printFCMToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var index = context.watch<TabViewModel>().activePageIndex;
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => Provider.of<TabViewModel>(context, listen: false)
            .changePageIndex(index),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}
