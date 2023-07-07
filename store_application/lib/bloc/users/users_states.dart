import 'package:store_application/model/user.dart';

abstract class UserStates {}

class InitialState extends UserStates {}

class SuccessState extends UserStates {
  User user;
  SuccessState({required this.user});
}

class FailureState extends UserStates {}

class LoadingState extends UserStates {}

// Get All success
// Error/Failure
// Loading