import 'package:equatable/equatable.dart';
import '../../models/user.dart';

class AuthState extends Equatable {
  const AuthState(
      {this.userLoading = false, this.versionNumber = '', this.user});

  final User? user;
  final String versionNumber;
  final bool userLoading;

  AuthState copyWith({
    User? user,
    String? versionNumber,
    bool? userLoading,
  }) {
    return AuthState(
        userLoading: userLoading ?? false,
        versionNumber: versionNumber ?? '',
        user: user);
  }

  @override
  List<Object?> get props => [user, versionNumber, userLoading];
}
