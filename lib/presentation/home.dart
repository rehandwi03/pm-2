import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pm_2/bloc/user_bloc.dart';
import 'package:pm_2/data/model/user_model.dart';
import 'package:pm_2/presentation/add_user.dart';
import 'package:pm_2/presentation/edit_user.dart';

Widget _buildBox(BuildContext context, UserModel user, Color color) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditUser(userID: user.id)))
          .then((_) => context.read<UserBloc>().add(FetchUserEvent()));
    },
    child: Container(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.7,
      // margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.date,
                style: TextStyle(fontSize: 17),
              ),
              Text(
                user.nama,
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
              ),
              Text(
                user.alamat,
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
              )
            ]),
      ),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => AddUser()))
              .then((_) => context.read<UserBloc>().add(FetchUserEvent()));
        },
      ),
      // backgroundColor: Color.fromRGBO(44, 62, 80, 1),
      appBar: AppBar(title: Text("List Data")),
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is UserLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is FetchUserLoadedState) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: GridView.custom(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: (1 / .6)),
                childrenDelegate: SliverChildBuilderDelegate(
                  (BuildContext, index) {
                    return _buildBox(
                        context,
                        state.users[index],
                        Color(Random().nextInt(0xffffffff))
                            .withAlpha(0xff)
                            .withOpacity(1.0));
                  },
                  childCount: state.users.length,
                )),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }

  @override
  void initState() {
    setState(() {});
    context.read<UserBloc>().add(FetchUserEvent());
    super.initState();
  }
}
