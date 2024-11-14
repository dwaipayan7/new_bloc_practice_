import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../bloc/onboarding_bloc.dart';

Widget buildBottomNavigation(BuildContext context, int pageIndex) {
  final pageController = PageController(initialPage: pageIndex);

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // "Back" Button
        if (pageIndex > 0)
          TextButton(
            onPressed: () {
              context.read<OnboardingBloc>().add(PreviousPageEvent());
            },
            child: const Text("Back"),
          )
        else
          const SizedBox(width: 60), // Spacer when Back button is not shown

        // SmoothPageIndicator in the center
        SmoothPageIndicator(
          controller: pageController,
          count: 3, // Number of pages
          effect: const WormEffect(
            dotWidth: 10,
            dotHeight: 10,
            activeDotColor: Colors.orange,
            dotColor: Colors.grey,
            spacing: 10,
          ),
        ),

        // "Next" or "Get Started" Button
        if (pageIndex < 2)
          ElevatedButton(
            onPressed: () {
              context.read<OnboardingBloc>().add(NextPageEvent());
            },
            child: const Text("Next"),
          )
        else
          ElevatedButton(
            onPressed: () {
              context.read<OnboardingBloc>().add(NextPageEvent());
            },
            child: const Text("Get Started"),
          ),
      ],
    ),
  );
}
