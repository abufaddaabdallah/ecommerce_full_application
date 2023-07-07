abstract class SignUpEvents {}

// Get All SignUp

class GetSignUpEvent extends SignUpEvents {}

class RemoveUserEvent extends SignUpEvents {
  int index;
  RemoveUserEvent(this.index);
}

class IncreaseUserEvent extends SignUpEvents {
  int index;
  IncreaseUserEvent(this.index);
}

class DecreaseUserEvent extends SignUpEvents {
  int index;
  DecreaseUserEvent(this.index);
}

// Add new SignUp
// Edit existing SignUp;
// Destory SignUp.
