import 'package:doublem/features/home/presentation/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  static const String path = '/splash_screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;
  late final List<Animation<Offset>> _animations;

  final List<String> _texts = [
    "Welcome to the app!",
    "Discover amazing features.",
    "Get started now!",
  ];

  @override
  void initState() {
    super.initState();

    // Initialize controllers and animations
    _controllers = List.generate(
      _texts.length,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 600),
        vsync: this,
      ),
    );

    _animations = _controllers
        .map(
          (controller) =>
              Tween<Offset>(
                begin: const Offset(0, 1), // Start below the screen
                end: Offset.zero, // Slide to its final position
              ).animate(
                CurvedAnimation(parent: controller, curve: Curves.easeInOut),
              ),
        )
        .toList();

    _startAnimations();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Future.delayed(Duration(seconds: 8), () {
      if (mounted) {
        context.go(HomeScreen.path);
      }
    });
  }

  Future<void> _startAnimations() async {
    for (var controller in _controllers) {
      await Future.delayed(
        const Duration(milliseconds: 400),
      ); // Delay between each text
      controller.forward(); // Start the animation
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < _texts.length; i++)
              AnimatedBuilder(
                animation: _animations[i],
                builder: (context, child) {
                  return Transform.translate(
                    offset: _animations[i].value,
                    child: Opacity(
                      opacity: _controllers[i].value,
                      child: child,
                    ),
                  );
                },
                child: Text(
                  _texts[i],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
