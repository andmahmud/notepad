import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      body: Column(
        children: [
          // Responsive AppBar wave
          ClipPath(
            clipper: AppBarWaveClipper(),
            child: Container(
              height: height * 0.25,
              color: Colors.blue,
              alignment: Alignment.center,
              child: SafeArea(
                child: Text(
                  'AppBar content',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.07,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Main Body Content',
                style: TextStyle(fontSize: width * 0.05),
              ),
            ),
          ),
        ],
      ),

      // Floating Action Button
      floatingActionButton: SizedBox(
        height: width * 0.18,
        width: width * 0.18,
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {},
          shape: const CircleBorder(),
          child: Icon(Icons.add, color: Colors.white, size: width * 0.08),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Responsive BottomAppBar
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: height * 0.08,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.home, color: Colors.white, size: width * 0.07),
              SizedBox(width: width * 0.15), // space for FAB
              Icon(Icons.person, color: Colors.white, size: width * 0.07),
            ],
          ),
        ),
      ),
    );
  }
}

// AppBar wave clipper (unchanged)
class AppBarWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 40,
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
