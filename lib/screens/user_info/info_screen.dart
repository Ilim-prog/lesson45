import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson45/components/user_infocard.dart';
import 'package:lesson45/model/user_model.dart';
import 'package:lesson45/screens/users_screen/bloc/users_bloc.dart';

class InfoScreen extends StatefulWidget {
  final int id;
  InfoScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  late UsersBloc usersBloc;
  late UserModel userModel;

  @override
  void initState() {
    usersBloc = UsersBloc();
    usersBloc.add(GetUserEvent(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'UserScreen',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        width: 350,
        height: 470,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.amber,
        ),
        child: BlocConsumer<UsersBloc, UsersState>(
          bloc: usersBloc,
          listener: (context, state) {
            if (state is UserFetchedState) {
              userModel = state.userModel;
            }

            if (state is UserErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error.message ?? '')));
            }
          },
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            print(state);

            if (state is UserFetchedState) {
              print(userModel.id);
              return Column(
                children: [
                  CustomCard(
                    text: 'id:',
                    num: userModel.id.toString(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomCard(
                    text: 'username:',
                    num: userModel.username.toString(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomCard(
                    text: 'email:',
                    num: userModel.email.toString(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomCard(
                    text: 'address:',
                    num: userModel.address?.street ?? '',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomCard(
                    text: 'pnone:',
                    num: userModel.phone.toString(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomCard(
                    text: 'website:',
                    num: userModel.website.toString(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomCard(
                    text: 'company:',
                    num: userModel.company?.name ?? '',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
