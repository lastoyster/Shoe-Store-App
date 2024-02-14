import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_app/app/data/data.dart';
import 'package:shoe_app/app/modules/widgets/animations/onboarding_animation.dart';

class OnboardingCard extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final bool playAnimation;
  const OnboardingCard(
      {super.key,
      required this.playAnimation,
      required this.image,
      required this.title,
      required this.description});

  @override
  State<OnboardingCard> createState() => _OnboardingCardState();
}

class _OnboardingCardState extends State<OnboardingCard>
    with TickerProviderStateMixin {
  late AnimationController _slideAnimationController;
  late Animation<Offset> _slideAnimation;

  Animation<Offset> get slideAnimation => _slideAnimation;
  AnimationController get slideAnimationController => _slideAnimationController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.playAnimation) {
      _slideAnimationController.forward();
    } else {
      print('Hello');
      _slideAnimationController.animateTo(
        1,
        duration: const Duration(milliseconds: 0),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _slideAnimationController =
        OnboardingAnimations.createSlideController(this);
    _slideAnimation =
        OnboardingAnimations.openSpotsSlideAnimation(_slideAnimationController);
  }

  @override
  void dispose() {
    _slideAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Column(
        children: [
          SizedBox(height: 96.h),
          Image.asset(widget.image, width: double.infinity, fit: BoxFit.fitWidth),
          const Spacer(),
          Text(widget.title, style: AppTypography.kBold24),
          SizedBox(height: 14.h),
          Text(widget.description, style: AppTypography.kMedium14),
        ],
      ),
    );
  }
}
