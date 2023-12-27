import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_clo/core/constants/firebase_collection_names.dart';
import 'package:facebook_clo/features/auth/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getUserInfoProvider =
    FutureProvider.autoDispose.family<UserModel, String>((ref, userId) {
  return FirebaseFirestore.instance
      .collection(FirebaseCollectionNames.users)
      .doc(userId)
      .get()
      .then((userData) {
    return UserModel.fromMap(userData.data()!);
  });
});
