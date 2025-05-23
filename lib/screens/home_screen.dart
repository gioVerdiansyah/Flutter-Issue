import 'package:animation_issue/screens/testing_screen.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Issue 1
            OpenContainer(
              transitionType: ContainerTransitionType.fadeThrough,
              transitionDuration: Duration(milliseconds: 600),
              closedElevation: 0,
              closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              closedBuilder: (context, openContainer) {
                return _buildButtonIssue(
                  title: "Issue 1",
                  color: Colors.deepOrange,
                  description:
                      "Saya ingin navigate ke suatu screen dengan animasi OpenContianer namun bottom nav dan "
                      "app bar tidak hilang.",
                  onPressed: openContainer,
                );
              },
              openBuilder: (context, _) => TestingScreen(),
            ),

            // Issue 2
            _buildButtonIssue(
              title: "Issue 2",
              color: Colors.orangeAccent,
              description:
                  "Saya berhasil menghilangkan bottom nav dan app bar ketika navigasi, namun ini tidak dengan animasi OpenContianer",
              onPressed: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: TestingScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonIssue({required String title, required Color color, required String description, required
  VoidCallback onPressed}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(color)),
          child: Text(title, style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(description, style: TextStyle(height: 1.1, color: Colors.black54), textAlign: TextAlign.center),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
