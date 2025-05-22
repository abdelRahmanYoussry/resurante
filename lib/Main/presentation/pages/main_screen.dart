import 'package:flutter/material.dart';
import 'package:resturente/Home/presentation/pages/home_screen.dart';
import 'package:resturente/Main/presentation/widgets/nav_bar_icon_widget.dart';
import 'package:resturente/core/utils/shared/app/assets_manager.dart';
import 'package:resturente/core/utils/shared/app/color_manager.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Sample pages
  final List<Widget> _pages = [
    HomeScreen(),
    const Center(
      child: Text(
        'Home',
      ),
    ),
    const Center(
      child: Text(
        'Add',
      ),
    ), // This is the plus center tab (not really a page)
    const Center(
      child: Text(
        'Notifications',
      ),
    ),
    const Center(
      child: Text(
        'Profile',
      ),
    ),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      // plus button tapped — handle differently if you want
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          content: Text('Plus button tapped!'),
        ),
      );
      return;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onItemTapped(2);
        },
        elevation: 20, // FloatingActionButton elevation (shadow)
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: const Icon(
          Icons.add,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 20,
              offset: const Offset(0, -3), // shadow upwards from bottom bar
            ),
          ],
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 15,
          elevation: 20,
          height: 70,
          color: ColorManager.mainPrimaryColor4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavIconButton(
                imagePath: ImageAssets.homeIcon,
                isSelected: _selectedIndex == 0,
                onTap: () => _onItemTapped(0),
              ),
              NavIconButton(
                imagePath: ImageAssets.userIcon,
                isSelected: _selectedIndex == 1,
                onTap: () => _onItemTapped(1),
              ),
              const SizedBox(width: 60), // gap for FAB
              NavIconButton(
                imagePath: ImageAssets.commentIcon,
                isSelected: _selectedIndex == 3,
                onTap: () => _onItemTapped(3),
              ),
              NavIconButton(
                imagePath: ImageAssets.heartIcon,
                isSelected: _selectedIndex == 4,
                onTap: () => _onItemTapped(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
