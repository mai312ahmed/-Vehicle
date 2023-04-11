abstract class AuthRepo {
  loginWithGoogle();
  loginWithPone();
  Future completInformation();
}

class AuthRepoImpl extends AuthRepo {
  @override
  Future completInformation() {
    throw UnimplementedError();
  }

  @override
  loginWithGoogle() {
    // TODO: implement loginWithGoogle
    throw UnimplementedError();
  }

  @override
  loginWithPone() {
    // TODO: implement loginWithPone
    throw UnimplementedError();
  }
}
