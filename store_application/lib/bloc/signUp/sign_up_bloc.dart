import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_application/bloc/signUp/sign_up_states.dart';

import '../../model/user.dart';
import 'sign_up_events.dart';



class SignUpBloc extends Bloc<SignUpEvents, SignUpStates> {
  List<User>? signUp;
  SignUpBloc() : super(InitialState());

 
}