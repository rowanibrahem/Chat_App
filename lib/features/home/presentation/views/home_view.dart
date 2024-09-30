import 'package:chatapp_mentor/features/calls/presentation/views/calls_view.dart';
import 'package:chatapp_mentor/features/home/presentation/views/widgets/home_body.dart';
import 'package:chatapp_mentor/features/home/presentation/views/widgets/home_bottom_nav_bar.dart';
import 'package:chatapp_mentor/features/home/presentation/views/widgets/home_view_appbar.dart';
import 'package:chatapp_mentor/features/status/presentation/views/status_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  final List<Widget> pages = [
    const ChatView(), 
    const StatusView(),
    const CallsView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeViewAppbar(),
      bottomNavigationBar: HomeBottomNavBar(
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: SafeArea(
        child: pages[selectedIndex],
      ),
    );
  }
}
