// ignore_for_file: avoid_print, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturente/Features/startup/presentation/manager/startup_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/services/services_locator.dart';
import '../../data/models/onboarding_model.dart';
import '../../domain/entities/onboarding.dart';
import '../../domain/use_cases/change_language_use_case.dart';
import '../../domain/use_cases/get_onboardingitems_usecase.dart';
import '../../domain/use_cases/get_saved_lang_use_case.dart';
import '../../domain/use_cases/update_boarding_view_use_case.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  final GetOnBoardingViewUseCase getOnBoardingViewUseCase;
  final UpdateOnBoardingViewUseCase updateOnBoardingViewUseCase;
  final GetSavedLocalLanUseCase getSavedLocalLanUseCase;
  final ChangeLanguageUseCase changeLanguageUseCase;
  OnBoardingCubit(
    this.getOnBoardingViewUseCase,
    this.updateOnBoardingViewUseCase,
    this.getSavedLocalLanUseCase,
    this.changeLanguageUseCase,
  ) : super(OnBoardingIntialState());
  static OnBoardingCubit get(context) => BlocProvider.of(context);

  bool isLast = false;
  bool isLastOnBoarding = false;
  bool isFilePicked = false;
  var selectedIndexes = [];
  int myRadioIndex = -1;
  List<OnBoarding> boarding = [
    const OnBoardingModel(
      title: LocaleKeys.onBoardingTitle1,
      body: LocaleKeys.onBoardingSubTitle1,
      image: ImageAssets.onBoardingLogo1,
    ),
    const OnBoardingModel(
      title: LocaleKeys.onBoardingTitle2,
      body: LocaleKeys.onBoardingSubTitle2,
      image: ImageAssets.onBoardingLogo2,
    ),
    const OnBoardingModel(
      title: LocaleKeys.onBoardingTitle3,
      body: LocaleKeys.onBoardingSubTitle3,
      image: ImageAssets.onBoardingLogo3,
    ),
  ];

  void changeBoardingIndex(int index) {
    if (index == boarding.length - 1) {
      isLast = true;
      emit(OnBoardingChangeIndexSuccessState());
      print(' last');
    } else {
      isLast = false;
      print('not last');
      emit(OnBoardingChangeIndexErrorState());
    }
  }

  void getBoardingBool() async {
    final boardingBool = await getOnBoardingViewUseCase(const NoParameters());
    boardingBool.fold((l) {
      emit(GetBoardingErrorState());
    }, (r) {
      isLastOnBoarding = r;
      emit(GetBoardingSuccessState());
    });
  }

  Future<void> setBoardingBool() async {
    final boardingBool = await updateOnBoardingViewUseCase(
        const UpdateOnBoardingParameters(isEnd: true));
    boardingBool.fold((l) {
      print('there is an error');
      emit(UpdateBoardingErrorState());
    }, (r) {
      AppMainBool.isOnBoarding = r;
      print(AppMainBool.isOnBoarding);
      emit(UpdateBoardingSuccessState());
    });
  }

  String currentLangCode = AppStrings.englishCode;
  Future<void> getLocalLan() async {
    final lanCode = await getSavedLocalLanUseCase(const NoParameters());
    lanCode.fold((l) {
      debugPrint('error');
      emit(LocalChangedErrorState());
    }, (r) {
      currentLangCode = r;
      debugPrint(currentLangCode);
      emit(
        LocalChangedSuccessState(
          Locale(
            currentLangCode,
          ),
        ),
      );
    });
  }

  Future<void> changeLocalLan(ChangeLanguageParameters parameters) async {
    final lanCode = await changeLanguageUseCase(parameters);
    lanCode.fold((l) {
      debugPrint('error');
      emit(LocalChangedErrorState());
    }, (r) {
      currentLangCode = parameters.local;
      debugPrint('$currentLangCode currentLangCode');
      emit(LocalChangedSuccessState(Locale(
        currentLangCode,
      )));
    });
  }

  void changeCheckBoxValue(int index) {
    if (selectedIndexes.contains(index)) {
      selectedIndexes.remove(index); // unselect
      emit(ChangeCheckBoxSuccessState(index: index));
    } else {
      selectedIndexes.add(index); // select
      emit(ChangeCheckBoxErrorState(index: index));
    }
  }

  void clearCheckBoxIndex(int index) {
    if (selectedIndexes.contains(index)) {
      selectedIndexes.remove(index); // unselect
      emit(ClearCheckBoxValueSuccessState(index: index));
    }
  }

  void changeRadioButtonValue({required int index}) {
    myRadioIndex = index;
    emit(ChangeRadioButtonSuccessState(index: index));
  }

  void changeFilePickedBool({required bool isPicked}) {
    if (isPicked == true) {
      isFilePicked = true;
    } else if (isPicked == false) {
      isFilePicked = true;
    } else {
      isFilePicked = false;
    }
    emit(ChangeFilePickedBoolSuccessState());
  }
}
