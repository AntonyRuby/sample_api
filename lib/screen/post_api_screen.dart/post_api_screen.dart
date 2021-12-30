import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/post_api_bloc.dart';

class PostApiScreen extends StatefulWidget {
  @override
  _PostApiScreenState createState() => _PostApiScreenState();
}

class _PostApiScreenState extends State<PostApiScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();
  TextEditingController _userIdController = TextEditingController();
  late PostApiBloc bloc;

  @override
  void initState() {
    bloc = PostApiBloc()..add(PostApiInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users Post Data"),
        backgroundColor: Colors.green,
      ),
      body: BlocListener<PostApiBloc, PostApiState>(
        listener: (context, state) {},
        bloc: bloc,
        child: BlocBuilder<PostApiBloc, PostApiState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is PostApiSuccessState) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(flex: 1, child: Text("Id: ")),
                          Expanded(
                            flex: 2,
                            child: Text(bloc.userspost.userId.toString()),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(flex: 1, child: Text("Title: ")),
                          Expanded(
                            flex: 2,
                            child: Text(bloc.userspost.title!),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(flex: 1, child: Text("Body: ")),
                          Expanded(
                            flex: 2,
                            child: Text(bloc.userspost.body!),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is PostApiLoadingState) {
              Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PostApiInitial) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(hintText: "Id"),
                        controller: _userIdController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(hintText: "Title"),
                        controller: _titleController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(hintText: "Body"),
                        controller: _bodyController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                          child: Text("Submit"),
                          color: Colors.green,
                          onPressed: () async {
                            int userId = int.parse(_userIdController.text);
                            String title = _titleController.text;
                            String body = _bodyController.text;

                            bloc.add(PostSubmitEvent(
                              userId,
                              title,
                              body,
                            ));
                          }),
                    )
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
