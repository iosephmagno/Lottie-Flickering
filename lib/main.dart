import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> { 
// Set cache size (max number of cached files)
Lottie.cache.maximumSize = 500;

// Pre-load the Lottie animation ahead of time

// Pre-load a file from local asset
final _lottieAnimation = AssetLottie('assets/8.zip').load();

// Pre-load a file from network
final _lottieAnimation = NetworkLottie(
    'https://d305e11xqcgjdr.cloudfront.net/stickers/cl69ghdwt000100bx966hxbp6/20.zip')
    .load();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<LottieComposition>(
        future: _lottieAnimation,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorWidget(snapshot.error!);
          }

          var animation = snapshot.data;
          if (animation != null) {
            return MyHomePage(lottieAnimation: animation);
          } else {
            // Don't show the app until the animation is loaded.
            // Since it is loaded from the local assets, it will only take 1 frame.
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // Only open the home page once we have the lottie animation fully loaded
  final LottieComposition lottieAnimation;

  const MyHomePage({Key? key, required this.lottieAnimation}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  // Create a shared animation controller that will be used by the
  late final _animationController = AnimationController(
      vsync: this, duration: widget.lottieAnimation.duration)
    ..repeat();

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
              // The FocusedMenuHolder internally uses a "Hero" widget
              // The hero widget will move the widget around and this operation
              // will create several "State".
              // https://stackoverflow.com/questions/56698362/hero-widget-inits-child-widget-multiple-times
              // The animation state will be reset and it create a jump.
              // To prevent that we use a shared AnimationController which will
              // hold the current animation state and remove the flicker.
              child: Lottie(
                composition: widget.lottieAnimation,
                controller: _animationController,
                height: 140,
                width: 140,
                frameRate: FrameRate.composition,
                options: LottieOptions(enableMergePaths: false),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
