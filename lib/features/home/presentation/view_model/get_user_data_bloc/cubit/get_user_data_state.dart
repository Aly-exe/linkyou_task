import 'package:linkyou_task/features/home/data/user_model.dart';

abstract class GetUserDataStates {}

class InitialUserDataState extends GetUserDataStates {}

class LoadingUserDataState extends GetUserDataStates {}

class SuccessGetUserDataState extends GetUserDataStates {
  final UserModel userData;

  SuccessGetUserDataState({required this.userData});
}

class FailureGetUserDataState extends GetUserDataStates {
  final String error;
  FailureGetUserDataState(this.error);
}
