import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/onboarding_bloc.dart';

Widget buildBottomNavigation(BuildContext context, int pageIndex) {
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),

    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if(pageIndex > 0)
          TextButton(
              onPressed: (){
                context.read<OnboardingBloc>().add(PreviousPageEvent());
              },
              child: Text("Back")
          ),
        if(pageIndex < 2)
            ElevatedButton(
                onPressed: (){
                  context.read<OnboardingBloc>().add(NextPageEvent());
                },
                child: Text("Next")
            )

        else
          ElevatedButton(
              onPressed: (){
                context.read<OnboardingBloc>().add(NextPageEvent());
              },
              child: Text("Get Started")
          )

      ],
    ),
  );
}
