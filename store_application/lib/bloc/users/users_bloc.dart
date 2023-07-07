import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/user_controller.dart';
import '../../model/user.dart';
import 'users_events.dart';
import 'users_states.dart';

class UserBloc extends Bloc<UserEvents, UserStates> {
  late User user;

  int? userId;
  UserBloc() : super(InitialState()) {

    on<GetUserEvent>(_getUser);
    // on<RemoveUserEvent>(_removeUser);
    // on<IncreaseUserEvent>(_increatementCounter);
    // on<DecreaseUserEvent>(_decreatementCounter);
  }

  FutureOr<void> _getUser(
      GetUserEvent event, Emitter<UserStates> emit) async {
    try {
      emit(LoadingState());
      user = await UserController().getUser();
      print("User Fetched");
      emit(SuccessState(user: user));
    } catch (ex) {
      emit(FailureState());
    }
  }

//   FutureOr<void> _removeUser(RemoveUserEvent event, Emitter<UsersState> emit) {
//     users!.removeAt(event.index);
//     emit(SuccessState(users: users!));
//   }

//   FutureOr<void> _increatementCounter(
//       IncreaseUserEvent event, Emitter<UsersState> emit) {
//     UserModel user = users![event.index];
//     if (user.counter < 100) {
//       user.counter++;
//     }
//     emit(SuccessState(users: users!));
//   }

//   FutureOr<void> _decreatementCounter(
//       DecreaseUserEvent event, Emitter<UsersState> emit) {
//     UserModel user = users![event.index];
//     if (user.counter > 0) {
//       user.counter--;
//     }
//     emit(SuccessState(users: users!));
//   }

}