import '../../../../core/utils/shared/app_routes/routes_manager.dart';
import '../../../../core/utils/shared/components/components.dart';
import '../manager/auth_cubit.dart';

Future<int> chooseRegisterTypeStep2(
    {required int registerType, required context}) async {
  switch (registerType) {
    case 0:
      navigateAndFinish(context, routeName: Routes.loginRoute);
      break;
    case 1:
      await AuthCubit.get(context).getTeacherMaterial(context: context);
      navigateAndFinish(context, routeName: Routes.teacherRegisterRoute);
      break;
    case 2:
      await AuthCubit.get(context).getEducationSystem(context: context);
      // if (CacheHelper.getSharedPreferencesValue(
      //         key: AppStrings.registerStepTwoSkipped) ==
      //     null) {
      navigateAndFinish(context, routeName: Routes.studentRegisterRoute);
      // }
      break;
  }
  return registerType;
}
