import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../base_equtable.dart';
import '../../../models/get_users_models/datum.dart';
import '../../../models/get_users_models/get_users.dart';
import '../../../respository/repository.dart';

part 'get_users_event.dart';
part 'get_users_state.dart';

class GetUsersBloc extends Bloc<GetUsersEvent, GetUsersState> {
  GetUsersBloc() : super(GetUsersInitial());

  List<Datum> usersList = [];
  String supportText = "";
  String message = '';

  @override
  Stream<GetUsersState> mapEventToState(
    GetUsersEvent event,
  ) async* {
    if (event is GetUsersInitialEvent) {
      yield GetUsersLoadingState();

      Map<String, dynamic> users = await getUsersData();

      if (users["success"] == true) {
        Map<String, dynamic> jsonData = users["data"];
        GetUsers usersData = GetUsers.fromJson(jsonData);
        usersList = usersData.data!;
        supportText = usersData.support!.text!;

        yield GetUsersLoadedState();
      } else {
        message = users["data"];
        yield GetUsersFailureState();
      }
    }
  }
}
