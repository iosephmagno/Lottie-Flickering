import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Screen"),
      ),
      body: ListView(
        reverse: true,
        children: [
          FocusedMenuHolder(
            enabled: true,
            right: true,
            pressScale: 1.0,
            itemExtent: 44,
            routeBackgroundColor: const Color(0x73000000),
            menuBoxDecoration: BoxDecoration(
              color: const Color(0xFFBFC0C2),
              borderRadius: BorderRadius.circular(12.0),
            ),
            menuItems: [
              FocusedMenuItem(
                title: const Text('Reply'),
                style: const TextStyle(
                  letterSpacing: -0.33,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
                trailingIcon: const Padding(
                  padding: EdgeInsets.only(right: 4.0),
                  child: Icon(
                    Icons.forward,
                    size: 16,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {},
              ),
              FocusedMenuItem(
                title: const Text('Copy'),
                style: const TextStyle(
                  letterSpacing: -0.33,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
                trailingIcon: const Padding(
                  padding: EdgeInsets.only(right: 4.0),
                  child: Icon(
                    Icons.copy,
                    size: 16,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {},
              ),
              FocusedMenuItem(
                title: const Text('Edit'),
                style: const TextStyle(
                  letterSpacing: -0.33,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
                trailingIcon: const Padding(
                  padding: EdgeInsets.only(right: 4.0),
                  child: Icon(
                    Icons.edit,
                    size: 16,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {},
              ),
              FocusedMenuItem(
                title: const Text('Forward'),
                style: const TextStyle(
                  letterSpacing: -0.33,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
                trailingIcon: const Padding(
                  padding: EdgeInsets.only(right: 4.0),
                  child: Icon(
                    Icons.forward,
                    size: 16,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {},
              ),
            ],
            child: Align(
              alignment: Alignment.bottomRight,
              child: LottieBuilder.asset(
                'assets/8.zip',
                height: 140,
                width: 140,
                frameRate: FrameRate.composition,
                options: LottieOptions(enableMergePaths: false),
                errorBuilder: (c, e, s) => Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                  ),
                ),
                repeat: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
