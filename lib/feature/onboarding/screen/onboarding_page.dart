import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bloc_practice/feature/onboarding/bloc/onboarding_bloc.dart';
import 'package:new_bloc_practice/feature/onboarding/widget/bottomNavigation.dart';
import 'package:new_bloc_practice/feature/onboarding/widget/buildOnboardingContent.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(); // Initialize controller once
  }

  @override
  void dispose() {
    _pageController.dispose(); // Clean up controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          final pageIndex = (state as OnboardingPageState).pageIndex;

          if (_pageController.hasClients && _pageController.page != pageIndex) {
            _pageController.animateToPage(
              pageIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.bounceInOut,
            );
          }

          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    context.read<OnboardingBloc>().add(
                        index > pageIndex ? NextPageEvent() : PreviousPageEvent());
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return buildOnboardingContent(index);
                  },
                ),
              ),
              buildBottomNavigation(context, pageIndex),
            ],
          );
        },
      ),
    );
  }
}
