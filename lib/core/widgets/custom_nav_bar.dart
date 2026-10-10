import 'package:flutter/material.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final VoidCallback onAddTap;

  const CustomBottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    const Color navColor = Color(0xFF438B86);
    const Color iconColor = Color(0xFF285F5C);

    return SizedBox(
      height: 85,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 55,
            decoration: const BoxDecoration(
              color: navColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navItem(Icons.home_outlined, 0, iconColor),
                _navItem(Icons.history, 1, iconColor),

                // Space for the center add button
                const SizedBox(width: 65),

                _navItem(Icons.account_balance_wallet_outlined, 2, iconColor),
                _navItem(Icons.person_outline, 3, iconColor),
              ],
            ),
          ),

          Positioned(
            top: 0,
            child: Container(
              height: 58,
              width: 58,
              decoration: BoxDecoration(
                color: navColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFF5F5F5),
                  width: 5,
                ),
              ),
              child: IconButton(
                onPressed: onAddTap,
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, int index, Color iconColor) {
    return IconButton(
      onPressed: () => onTap(index),
      icon: Icon(
        icon,
        size: 23,
        color: currentIndex == index ? Colors.white : iconColor,
      ),
    );
  }
}