part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingEvent {}

class NextPageEvent extends OnboardingEvent{}

class PreviousPageEvent extends OnboardingEvent{}
