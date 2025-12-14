import 'package:flutter/material.dart';

class PupilsPage extends StatelessWidget {
  const PupilsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,                                     //to remove the back arrow automatically added by the appBar widg
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Pupils",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 22,
            ),
          ),
          actions: [
            _topIconButton(
              icon: Icons.info_outline,
              onTap: () {
                
              },
            ),
            _topIconButton(
              icon: Icons.add,
              onTap: () {
                
              },
            ),
            const SizedBox(width: 8),
          ],
        ),
      
       
        body: const Center(
          child: Text(
            'There are no pupils yet.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }

  Widget _topIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Material(
        color: Colors.white,
        elevation: 2,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: SizedBox(
            width: 44,
            height: 44,
            child: Icon(
              icon,
              color: Colors.purple,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }
}