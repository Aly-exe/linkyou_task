import 'package:linkyou_task/core/constants/api_constants.dart';
import 'package:linkyou_task/core/helper/dio_helper.dart';
import 'package:linkyou_task/features/home/data/user_model.dart';

class GetUsersViewModel{
  
  static Future getUserData()async{
    await DioHelper.getData(ApiConstants.getUsers).then((value) {
      return UserModel.fromJson(value.data);
    });
  }
}