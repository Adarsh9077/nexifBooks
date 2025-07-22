class AuthState {
  final bool isLoading;
  final bool isAuthenticated;

  AuthState({required this.isLoading, required this.isAuthenticated});

  factory AuthState.initial() =>
      AuthState(isLoading: false, isAuthenticated: false);

  AuthState copyWith({bool? isLoading, bool? isAuthenticated}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}
