import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sau_mukratha_app/views/about_ui.dart';
import 'package:sau_mukratha_app/views/cal_bill_ui.dart';
import 'package:sau_mukratha_app/views/menu_ui.dart';
import 'package:sau_mukratha_app/views/show_bill_ui.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  NotchBottomBarController _pageController = NotchBottomBarController(index: 1);

  List<Widget> viewInbody = [
    CalBillUi(),
    MenuUi(),
    AboutUi(),
  ];

  int indexshow = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tech SAU BUFFET",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 102, 0),
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        onTap: (valuePage) {
          setState(() {
            indexshow = valuePage;
          });
        },
        kIconSize: 24,
        kBottomRadius: 20,
        notchColor: Colors.deepOrange,
        color: Colors.deepOrange,
        notchBottomBarController: _pageController,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: Icon(
              FontAwesomeIcons.moneyBill1Wave,
              color: Colors.grey,
            ),
            activeItem: Icon(
              FontAwesomeIcons.moneyBill1Wave,
              color: Colors.white,
            ),
            itemLabel: 'คิดเงิน',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            activeItem: Icon(
              Icons.home,
              color: Colors.white,
            ),
            itemLabel: 'Home',
          ),

          ///svg item
          BottomBarItem(
            inActiveItem: Icon(
              Icons.star,
              color: Colors.grey,
            ),
            activeItem: Icon(
              Icons.star,
              color: Colors.white,
            ),
            itemLabel: 'เกี่ยวกับ',
          ),
        ],
      ),
      body: viewInbody[indexshow],
    );
  }
}
