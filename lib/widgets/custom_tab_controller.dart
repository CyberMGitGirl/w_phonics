import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key, required this.tabController});

  final TabController tabController;

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(() {
      if (mounted) setState(() {});                                                                                      //advised, to prevent crashes
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage("assets/images/curve_rect.png"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,                                                                                 //to fit into image
          ),
        ),
        height: 100,
        child: TabBar(
          controller: widget.tabController,
          dividerHeight: 0,
          indicatorColor: Colors.transparent,
          labelPadding: EdgeInsets.zero,                                                                                      //to control the padding around the tab widget
          tabs: [
            _buildBottomNavItem(index: 0, activeColor: Colors.redAccent, icon: Icons.menu_book_rounded,),                   //made book color more red or pink, than amber.shade900, also I prefer the look of menu book, over book
            _buildBottomNavItem(index: 1, activeColor: Colors.lightBlue, icon: Icons.sports_esports_rounded,),
            _buildBottomNavItem(index: 2, activeColor: Colors.green, icon: Icons.music_note_rounded,),                      //may need to get FontAwesomeIcons package to get more exact icons
            _buildBottomNavItem(index: 3, activeColor: Colors.purple, icon: Icons.checklist_rounded),                       //preferred ovr list
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem({
    required int index,
    required Color activeColor,
    required IconData icon,
  }) {
  final bool isMiddleTab = index == 1 || index ==2;                                                                          //raise the 2 center icons to follow the curve
  

    return Transform.translate(
      offset: Offset(0, isMiddleTab ? -15 : 0),                                                                              //how intense
      child: Container(
      
        height: 55,                                                                                                         //i also liked the look of 56
        width: 55,
        padding: EdgeInsets.all(5),
      
        decoration: ShapeDecoration(                                                                                         //for accuracy, I used ShapeDecoration not BoxDecoration
          
          color: widget.tabController.index == index ? activeColor : Colors.white,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(40),

          )
          
          
        ),
        child: Tab(
          icon: Icon(
            icon,
            size: 45,
            color: widget.tabController.index == index
                ? Colors.white
                : activeColor,
          ),
        ),
      ),
    );
  }
}



