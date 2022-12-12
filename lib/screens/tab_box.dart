import 'package:device_shop/screens/basket_page/basket_page.dart';
import 'package:device_shop/screens/card_page/card_page.dart';
import 'package:device_shop/screens/home_page/home_page.dart';
import 'package:device_shop/screens/profile_page/profile_page.dart';
import 'package:device_shop/view_model/tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabBox extends StatefulWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> screens = [];

  @override
  void initState() {
    screens.add(const HomePage());
    screens.add(const CartPage());
    screens.add(const ProfilePage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Date Time Now : ${DateTime.now()}");
    var index = context.watch<TabViewModel>().activePageIndex;
    print(DateTime.now().toString());
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => Provider.of<TabViewModel>(context, listen: false)
            .changePageIndex(index),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}