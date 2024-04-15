import 'package:flutter/material.dart';

class PythonIntegration extends StatefulWidget {
  const PythonIntegration({Key? key}) : super(key: key);

  @override
  State<PythonIntegration> createState() => _PythonIntegrationState();
}

class _PythonIntegrationState extends State<PythonIntegration> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 2 * 3.141,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _animation.value,
                    child: Image.asset("assets/images/opencv.jpeg", width: 150, height: 150),
                  );
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),

            Column(
              children: [
                Container(
                    width: 300,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topRight: Radius.circular(20)),
                        color: Colors.blueGrey.shade200
                    ),
                    child: Center(child: Text("OpenCv",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 50
                    ),))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
