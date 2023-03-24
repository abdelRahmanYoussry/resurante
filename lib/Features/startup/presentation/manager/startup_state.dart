// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class OnBoardingStates extends Equatable {}

class OnBoardingIntialState extends OnBoardingStates {
  @override
  List<Object?> get props => [];
}

class OnBoardingChangeIndexSuccessState extends OnBoardingStates {
  @override
  List<Object?> get props => [];
}

class OnBoardingChangeIndexErrorState extends OnBoardingStates {
  @override
  List<Object?> get props => [];
}

class GetBoardingSuccessState extends OnBoardingStates {
  @override
  List<Object?> get props => [];
}

class GetBoardingErrorState extends OnBoardingStates {
  @override
  List<Object?> get props => [];
}

class UpdateBoardingSuccessState extends OnBoardingStates {
  @override
  List<Object?> get props => [];
}

class UpdateBoardingErrorState extends OnBoardingStates {
  @override
  List<Object?> get props => [];
}

class LocalChangedSuccessState extends OnBoardingStates {
  final Locale selectedLocale;
  LocalChangedSuccessState(this.selectedLocale);
  @override
  List<Object?> get props => [selectedLocale];
}

class LocalChangedErrorState extends OnBoardingStates {
  @override
  List<Object?> get props => [];
}

class ChangeCheckBoxSuccessState extends OnBoardingStates {
  final int index;
  ChangeCheckBoxSuccessState({required this.index});
  @override
  List<Object?> get props => [index];
}

class ChangeCheckBoxErrorState extends OnBoardingStates {
  int index;
  ChangeCheckBoxErrorState({required this.index});
  @override
  List<Object?> get props => [index];
}

class ClearCheckBoxValueSuccessState extends OnBoardingStates {
  final int index;
  ClearCheckBoxValueSuccessState({required this.index});
  @override
  List<Object?> get props => [index];
}

class ChangeRadioButtonSuccessState extends OnBoardingStates {
  int index;

  ChangeRadioButtonSuccessState({required this.index});
  @override
  List<Object?> get props => [index];
}

class ChangeRadioButtonErrorState extends OnBoardingStates {
  int index;

  ChangeRadioButtonErrorState({required this.index});
  @override
  List<Object?> get props => [index];
}

class ChangeFilePickedBoolSuccessState extends OnBoardingStates {
  @override
  List<Object?> get props => [];
}
