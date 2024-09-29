import 'package:bloc/bloc.dart';
import 'package:linkyou_task/core/constants/api_constants.dart';
import 'package:linkyou_task/core/helper/dio_helper.dart';
import 'package:linkyou_task/features/home/data/user_model.dart';
import 'package:linkyou_task/features/home/presentation/view_model/get_user_data_bloc/cubit/get_user_data_state.dart';
class GetUserDataBloc extends Cubit<GetUserDataStates> {
  GetUserDataBloc() : super(InitialUserDataState());
  
  Future getUserData()async{
    emit(LoadingUserDataState());
    final response = await DioHelper.getData(ApiConstants.getUsers);
        if (response.statusCode == 200) {
          UserModel userData = UserModel.fromJson(response.data);
          emit(SuccessGetUserDataState(userData: userData));
        } else {
          emit(FailureGetUserDataState("Failed to fetch data"));
        }
  }
}
