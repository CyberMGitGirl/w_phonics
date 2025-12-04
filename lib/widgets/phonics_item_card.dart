import 'package:flutter/material.dart';


/// Represent each section in a lesson page
class PhonicsItemPageCard extends StatelessWidget {
  const PhonicsItemPageCard({
    super.key,
    required this.title,
    required this.child,
    this.actions,
    this.bottomItem,
  });

  final String title;
  final Widget child;
  final Widget? actions;
  final Widget? bottomItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                if (actions != null) actions!,
              ],
            ),
          ),
          Container(child: child),

          if (bottomItem != null) bottomItem!,
        ],
      ),
    );
  }
}
