import 'package:figma_design_clone/core/widgets/custom_nav_bar.dart';
import 'package:figma_design_clone/view/pages/add_page.dart';
import 'package:figma_design_clone/view/pages/history_page.dart';
import 'package:figma_design_clone/view/pages/home.dart';
import 'package:figma_design_clone/view/pages/profile_page.dart';
import 'package:figma_design_clone/view/pages/wallet_page.dart';
import 'package:flutter/material.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    HistoryPage(),
    WalletPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),

      bottomNavigationBar: CustomBottomNavbar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        onAddTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddPage(),
            ),
          );
        },
      ),
    );
  }
}