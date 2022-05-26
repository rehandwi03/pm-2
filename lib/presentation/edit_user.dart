import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pm_2/bloc/user_bloc.dart';

class EditUser extends StatefulWidget {
  final String userID;
  const EditUser({Key? key, required this.userID}) : super(key: key);

  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final _formKey = GlobalKey<FormState>();
  String _id = "";

  TextEditingController _name = TextEditingController();
  TextEditingController _alamat = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is EditUserSuccessState) {
          final snackBar = SnackBar(
            content: Text(state.message),
            action: SnackBarAction(
              label: 'Hilangkan',
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          Navigator.pop(context);
        }
      },
      child: BlocBuilder<UserBloc, UserState>(builder: ((context, state) {
        if (state is GetUserLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is EditUserLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is GetUserLoadedState) {
          _id = state.user.id;
          _name.text = state.user.nama;
          _alamat.text = state.user.alamat;
          return _buildForm(context);
        }

        return Container();
      })),
    );
  }

  @override
  void dispose() {
    _name.dispose();
    _alamat.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context.read<UserBloc>().add(GetUserByIDEvent(id: widget.userID));
    super.initState();
  }

  Widget _buildForm(
    BuildContext context,
  ) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Data"),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Hapus Data'),
                      content: Text('Apa anda yakin akan menghapus data ini?'),
                      actions: [
                        ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Tidak',
                              style: TextStyle(color: Colors.blue),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              context
                                  .read<UserBloc>()
                                  .add(DeleteUserByIDEvent(id: _id));
                              Navigator.pop(context);
                            },
                            child: Text("Ya")),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.delete))
          ],
        ),
        body: Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.all(10),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: _name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: "Nama",
                          hintText: "Masukan nama"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: _alamat,
                      maxLines: 8,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          labelText: "Alamat",
                          hintText: "Masukan alamat"),
                      validator: (value) {
                        if (value == null) {
                          return 'Alamat tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            context.read<UserBloc>().add(EditUserEvent(
                                id: _id,
                                nama: _name.text,
                                alamat: _alamat.text));
                          },
                          child: Text("Update"))
                    ],
                  )
                ],
              )),
        ));
  }
}
