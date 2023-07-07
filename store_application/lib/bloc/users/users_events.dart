abstract class UserEvents {}

// Get All Login

class GetUserEvent extends UserEvents {}

class RemoveUserEvent extends UserEvents {
  int index;
  RemoveUserEvent(this.index);
}

class IncreaseUserEvent extends UserEvents {
  int index;
  IncreaseUserEvent(this.index);
}

class DecreaseUserEvent extends UserEvents {
  int index;
  DecreaseUserEvent(this.index);
}

// Add new Login
// Edit existing Login;
// Destory Login.
