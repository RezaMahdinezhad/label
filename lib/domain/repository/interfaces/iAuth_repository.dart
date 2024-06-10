abstract class IAuthRrepository {
  Future isAuthenticated();

  Future logout();

  Future<dynamic> login(String username, String password);
}
