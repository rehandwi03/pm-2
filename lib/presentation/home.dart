import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pm_2/bloc/reqres_bloc.dart';
import 'package:pm_2/data/repository/reqres_repository.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ReqresBloc(RepositoryProvider.of<ReqresRepository>(context))
            ..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text("Reqres")),
        body: BlocBuilder<ReqresBloc, ReqresState>(builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is UserLoadedState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.network(state.user.data.avatar),
                ),
                Container(
                  child: Text(
                    state.user.data.email,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<ReqresBloc>(context).add(LoadUserEvent());
                    },
                    child: Text("Get"))
              ],
            ));
          }

          if (state is UserErrorState) {
            return Center(
              child: Text(state.error.toString()),
            );
          }

          return const Center();
        }),
      ),
    );
  }
}
