import '../../model/user.dart';

abstract class SignUpStates {}

class InitialState extends SignUpStates {}

class SuccessState extends SignUpStates {
  List<User> signUp;
  SuccessState({required this.signUp});
}

class FailureState extends SignUpStates {}

class LoadingState extends SignUpStates {}

// Get All success
// Error/Failure
// Loading