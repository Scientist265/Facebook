import 'package:facebook_clo/features/chat/repository/chat_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatProvider = Provider<ChatRepository>((ref) {
  return ChatRepository();
});
