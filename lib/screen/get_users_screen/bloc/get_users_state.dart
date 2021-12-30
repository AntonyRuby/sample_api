part of 'get_users_bloc.dart';

@immutable
class GetUsersState extends BaseEquatable {}

class GetUsersInitial extends GetUsersState {}

class GetUsersLoadingState extends GetUsersState {}

class GetUsersLoadedState extends GetUsersState {}

class GetUsersFailureState extends GetUsersState {}
