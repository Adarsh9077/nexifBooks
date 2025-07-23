import 'package:nexifbook/features/auth/controller/auth_state.dart';
import 'package:nexifbook/features/auth/services/auth_service.dart';
import 'package:riverpod/riverpod.dart';

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) {
    return AuthController();
  },
);

class AuthController extends StateNotifier<AuthState> {
  AuthController() : super(AuthState.initial());

  Future<bool> login(String email, String password) async {
    state = state.copyWith(isLoading: true);
    final success = await AuthService.login(email, password);
    state = state.copyWith(isAuthenticated: true, isLoading: false);
    return success;
  }

  Future<void> getUserDetails() async {
    await AuthService.getUserDetails();
  }

  Future<void> getCompanyDetails() async {
    await AuthService.getCompanyDetails();
  }
}
