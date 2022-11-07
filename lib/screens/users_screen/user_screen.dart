import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson45/model/user_model.dart';
import 'package:lesson45/screens/users_screen/bloc/users_bloc.dart';
import 'package:lesson45/screens/user_info/info_screen.dart';
import 'package:lesson45/screens/users_screen/widgets/user_card.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late UsersBloc usersBloc;
  late List<UserModel> userModelList;

  @override
  void initState() {
    usersBloc = UsersBloc();
    usersBloc.add(GetAllUsersEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Все пользователи"),
      ),
      body: BlocConsumer<UsersBloc, UsersState>(
          bloc: usersBloc,
          listener: (context, state) {
            if (state is UsersFetchedState) {
              userModelList = state.userModelList;
            }

            if (state is UserErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error.message ?? '')));
            }
          },
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            print(state);
            if (state is UsersFetchedState) {
              print(userModelList.length);
              return ListView.builder(
                  itemCount: userModelList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                InfoScreen(id: userModelList[index].id ?? 0),
                          ),
                        );
                      },
                      child: UserCard(
                        name: userModelList[index].name ?? "Unknown",
                      ),
                    );
                  });
            }
            return const SizedBox();
          }),
    );
  }
}
