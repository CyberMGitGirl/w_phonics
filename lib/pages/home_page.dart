import 'package:flutter/material.dart';
import 'package:w_phonics/pages/lessons_page.dart';
import 'package:w_phonics/pages/profile_page.dart';
import 'package:w_phonics/pages/pupils_page.dart';
import 'package:w_phonics/pages/songs_page.dart';
import 'package:w_phonics/widgets/custom_tab_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this);                               //4 not 2
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: [LessonsPage(), ProfilePage(), SongsPage(), PupilsPage()],               //the pupils page (for testing: just added songs placeholder page)
      ),
      bottomNavigationBar: CustomBottomNavigation(tabController: tabController,),
    );
  }
}
