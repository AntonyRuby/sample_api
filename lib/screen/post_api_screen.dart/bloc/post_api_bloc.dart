import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../base_equtable.dart';
import '../../../models/post_api_models/post_api.dart';
import '../../../respository/repository.dart';

part 'post_api_event.dart';
part 'post_api_state.dart';

class PostApiBloc extends Bloc<PostApiEvent, PostApiState> {
  PostApiBloc() : super(PostApiInitial());

  PostApi userspost = PostApi();
  String message = '';

  @override
  Stream<PostApiState> mapEventToState(
    PostApiEvent event,
  ) async* {
    if (event is PostSubmitEvent) {
      yield PostApiLoadingState();
      var requestData =
          PostApi(body: event.body, title: event.title, userId: event.userId);
      Map<String, dynamic> usersData = await usersPostData(requestData);
      if (usersData["success"] == true) {
        Map<String, dynamic> jsonData = usersData["data"];
        userspost = PostApi.fromJson(jsonData);
        yield PostApiSuccessState();
      } else {
        message = usersData["data"];
      }
    }
  }
}
