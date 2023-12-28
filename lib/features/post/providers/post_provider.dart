import 'package:facebook_clo/features/post/repository/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postProvider = Provider((ref) {
  return PostReository();
});
