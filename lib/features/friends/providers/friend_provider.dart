import 'package:facebook_clo/features/friends/repository/firends_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final friendProvider = Provider<FriendRepository>((ref) {
  return FriendRepository();
});
