part of '../app_router.dart';

enum SlideDirection { left, right }
class HorizontalSlide extends CustomTransitionPage {
  final SlideDirection direction;
  HorizontalSlide({required this.direction,required super.child,required super.key,required super.name, required super.arguments,super.restorationId})
      : super(
          transitionDuration: const Duration(milliseconds: 400),
          reverseTransitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation, Widget child) {
            Offset begin = Offset(direction == SlideDirection.right ? 1 : -1, 0);
            Offset end = const Offset(0, 0);
            Tween<Offset> tween = Tween(begin: begin, end: end);
            CurvedAnimation curveAnimations =
                CurvedAnimation(parent: animation, curve: Curves.fastEaseInToSlowEaseOut);
            return SlideTransition(
              position: tween.animate(curveAnimations),
              child: child,
            );
          },
        );
}