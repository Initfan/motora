import 'package:flutter/material.dart';
import 'package:motora/screen/activity.dart';
import 'package:motora/ui/home/widget/home_screen.dart';
import 'package:motora/screen/motor/motor.dart';
import 'package:motora/screen/profile.dart';
import 'package:motora/screen/report.dart';
import 'package:motora/utils/colors.dart';

class Motora extends StatefulWidget {
  final int initialIndex;

  const Motora({super.key, this.initialIndex = 0});

  @override
  State<Motora> createState() => _MotoraState();
}

class _MotoraState extends State<Motora> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    if (_currentIndex == index) return;

    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> get _pages {
    return const [
      HomeScreen(),
      MotorPage(),
      ActivityPage(),
      ReportPage(),
      ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFEFE),
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE7E9EC), width: 1)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 68,
          child: Row(
            children: [
              _NavItem(
                index: 0,
                currentIndex: _currentIndex,
                icon: Icons.home_outlined,
                activeIcon: Icons.home_rounded,
                label: 'Home',
                onTap: _onItemTapped,
              ),

              _NavItem(
                index: 1,
                currentIndex: _currentIndex,
                icon: Icons.two_wheeler_outlined,
                activeIcon: Icons.two_wheeler_rounded,
                label: 'Motor',
                onTap: _onItemTapped,
              ),

              _NavItem(
                index: 2,
                currentIndex: _currentIndex,
                icon: Icons.assignment_outlined,
                activeIcon: Icons.assignment_rounded,
                label: 'Aktivitas',
                onTap: _onItemTapped,
              ),

              _NavItem(
                index: 3,
                currentIndex: _currentIndex,
                icon: Icons.bar_chart_outlined,
                activeIcon: Icons.bar_chart_rounded,
                label: 'Laporan',
                onTap: _onItemTapped,
              ),

              _NavItem(
                index: 4,
                currentIndex: _currentIndex,
                icon: Icons.person_outline_rounded,
                activeIcon: Icons.person_rounded,
                label: 'Profile',
                onTap: _onItemTapped,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final int index;
  final int currentIndex;

  final IconData icon;
  final IconData activeIcon;
  final String label;

  final ValueChanged<int> onTap;

  const _NavItem({
    required this.index,
    required this.currentIndex,
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = index == currentIndex;

    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onTap(index),
          child: SizedBox(
            height: 68,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isActive ? activeIcon : icon,
                  size: 24,
                  color: isActive ? AppColors.green : const Color(0xFF737B84),
                ),

                const SizedBox(height: 4),

                Text(
                  label,
                  style: TextStyle(
                    fontSize: 11,
                    color: isActive ? AppColors.green : const Color(0xFF737B84),
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
