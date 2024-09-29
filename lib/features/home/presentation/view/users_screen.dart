import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkyou_task/features/home/presentation/view/widgets/user_card_widget.dart';
import 'package:linkyou_task/features/home/presentation/view_model/get_user_data_bloc/cubit/get_user_data_cubit.dart';
import 'package:linkyou_task/features/home/presentation/view_model/get_user_data_bloc/cubit/get_user_data_state.dart';
import 'package:linkyou_task/features/home/presentation/view_model/get_users_view_model.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetUsersViewModel.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => GetUserDataBloc()..getUserData(),
      child: BlocBuilder<GetUserDataBloc, GetUserDataStates>(
        builder: (context, state) {
          return  Scaffold(
            body: state is LoadingUserDataState? Center(child: CircularProgressIndicator()) : state is SuccessGetUserDataState ? Padding(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                    itemCount: state.userData.userData!.length,
                    itemBuilder: (contxet, index) {
                      return UserCardWidget(state.userData,index);
                    })) : const Center(child: Text("We Can't Fetch Data"),)
          );
        },
      ),
    ));
  }
}
