import 'package:facebook_clo/features/auth/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final friendProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});
