import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final int totalPages = 3;
  OnboardingBloc() : super(OnboardingPageState(pageIndex: 0)) {

    on<NextPageEvent>(nextPageEvent);
    on<PreviousPageEvent>(previousPageEvent);

  }

  FutureOr<void> nextPageEvent(NextPageEvent event, Emitter<OnboardingState> emit) {

    final currentIndex = (state as OnboardingPageState).pageIndex;
    if(currentIndex < totalPages-1){
      emit(OnboardingPageState(pageIndex: currentIndex+1));
    }


  }

  FutureOr<void> previousPageEvent(PreviousPageEvent event, Emitter<OnboardingState> emit) {

    final currentIndex = (state as OnboardingPageState).pageIndex;
    if(currentIndex > 0 ){
      emit(OnboardingPageState(pageIndex: currentIndex-1));
    }

  }
}
