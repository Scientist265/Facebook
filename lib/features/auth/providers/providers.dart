import 'package:facebook_clo/features/auth/repository/auth_repository.dart';
import 'package:riverpod/riverpod.dart';

final authProvider = Provider((ref) => AuthRepository());
