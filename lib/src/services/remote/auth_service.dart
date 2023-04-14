import '../../common/network_handler.dart';
import '../../models/user.dart';

class AuthService {
  final NetworkHandler _networkHandler;
  AuthService(this._networkHandler);

  Future<User?> getCustomerDetails() async {
    try {
      final res = await _networkHandler.get(url: 'user/me');
      User user;

      if (res != null) {
        user = User.fromJson(res.data['data']);
        return user;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
