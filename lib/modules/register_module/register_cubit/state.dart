abstract class RegisterState{}

class RegisterInitialState extends RegisterState{}

class RegisterLoadingState extends RegisterState{}

class RegisterSuccessState extends RegisterState{}

class RegisterErrorState extends RegisterState{
  final String error;

  RegisterErrorState(this.error);}

class RegisterGetUserSuccessState extends RegisterState{}

class RegisterGetUserLoadingState extends RegisterState{}

class RegisterGetUserErrorState extends RegisterState{
  final String error;

  RegisterGetUserErrorState(this.error);
}

class TravelerChangePasswordVisibilityState extends RegisterState{}

