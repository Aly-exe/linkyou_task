import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkyou_task/features/home/presentation/view/widgets/custom_circural_indecator.dart';
import 'package:linkyou_task/features/home/presentation/view/widgets/user_card_widget.dart';
import 'package:linkyou_task/features/home/presentation/view_model/get_user_data_bloc/cubit/get_user_data_cubit.dart';
import 'package:linkyou_task/features/home/presentation/view_model/get_user_data_bloc/cubit/get_user_data_state.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => GetUserDataBloc()..getUserData(),
      child: BlocBuilder<GetUserDataBloc, GetUserDataStates>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text('Users'),
              ),
              body: state is LoadingUserDataState
                  ? const CustomCircuralIndictaor()
                  : state is SuccessGetUserDataState
                      ? Padding(
                          padding: const EdgeInsets.all(10),
                          child: ListView.builder(
                              itemCount: state.userData.userData!.length,
                              itemBuilder: (contxet, index) {
                                return UserCardWidget(state.userData, index);
                              }))
                      : const Center(
                          child: Text("We Can't Fetch Data"),
                        ));
        },
      ),
    ));
  }
}
