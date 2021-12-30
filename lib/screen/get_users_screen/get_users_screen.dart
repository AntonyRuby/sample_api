import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/get_users_bloc.dart';

class GetUsersScreen extends StatefulWidget {
  @override
  _GetUsersScreenState createState() => _GetUsersScreenState();
}

class _GetUsersScreenState extends State<GetUsersScreen> {
  late GetUsersBloc bloc;

  @override
  void initState() {
    bloc = GetUsersBloc()..add(GetUsersInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Users Screen'),
      ),
      body: BlocListener<GetUsersBloc, GetUsersState>(
          listener: (context, state) {},
          bloc: bloc,
          child: BlocBuilder<GetUsersBloc, GetUsersState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is GetUsersLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is GetUsersFailureState) {
                return Text(bloc.message);
              } else if (state is GetUsersLoadedState) {
                return SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(bloc.supportText),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: bloc.usersList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Id:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Expanded(
                                          flex: 2,
                                          child: Text(bloc.usersList[index].id
                                              .toString()),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Email: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                              bloc.usersList[index].email!),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "First Name: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                              bloc.usersList[index].firstName!),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Last Name: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                              bloc.usersList[index].lastName!),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                );
              }

              return Container();
            },
          )),
    );
  }
}
