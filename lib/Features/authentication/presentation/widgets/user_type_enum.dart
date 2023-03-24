import 'package:hassy/core/utils/shared/app_routes/routes_manager.dart';
import 'package:hassy/core/utils/shared/components/components.dart';

import '../manager/auth_cubit.dart';

Future<int> chooseUserType({required int type, required context}) async {
  switch (type) {
    case 0:
      navigateAndFinish(context, routeName: Routes.loginRoute);
      break;
    case 1:
      await AuthCubit.get(context).getTeacherMaterial(context: context);
      navigateAndFinish(context, routeName: Routes.teacherMainScreenRoute);
      break;
    case 2:
      await AuthCubit.get(context).getUserData(context: context);
      navigateAndFinish(context, routeName: Routes.studentMainScreenRoute);
      break;
  }
  return type;
}
