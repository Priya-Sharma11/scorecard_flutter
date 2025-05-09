import 'package:flutter/material.dart';

class BlinkingLiveBadgeWidget extends StatefulWidget {
  const BlinkingLiveBadgeWidget({super.key});

  @override
  State<BlinkingLiveBadgeWidget> createState() =>
      _BlinkingLiveBadgeWidgetState();
}

class _BlinkingLiveBadgeWidgetState extends State<BlinkingLiveBadgeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)
          ..repeat(reverse: true);
    _opacity = Tween<double>(begin: 1.0, end: 0.3).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          'LIVE',
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 10),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
