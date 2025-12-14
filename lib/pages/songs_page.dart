import 'package:flutter/material.dart';                                          //page added for home_page sake, to make it 4

class SongsPage extends StatelessWidget {
  const SongsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Songs"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: const Center(
          child: Text(
            "Songs Page Placeholder",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
