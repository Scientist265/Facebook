import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_clo/core/constants/firebase_collection_names.dart';
import 'package:facebook_clo/core/constants/storage_folder_names.dart';
import 'package:facebook_clo/core/utils/utils.dart';
import 'package:facebook_clo/features/auth/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class AuthRepository {
  final _auth = FirebaseAuth.instance;
  final _storage = FirebaseStorage.instance;
  final _firestore = FirebaseFirestore.instance;

// SIgnIn
  Future<UserCredential?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } catch (e) {
      showToastMessage(text: e.toString());
      return null;
    }
  }

  // Sign OUt

  Future<String?> signOut() async {
    try {
      _auth.signOut();
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  // Create Account

  Future<UserCredential?> createAccount({
    required String fullName,
    required String birthday,
    required String gender,
    required String email,
    required String password,
    required File? image,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //Save image to Firebase

      final path = _storage
          .ref(StorageFolderNames.profilePics)
          .child(_auth.currentUser!.uid);

      if (image == null) {
        return null;
      }
      final taskSnapshot = await path.putFile(image);
      final downloadUrl = await taskSnapshot.ref.getDownloadURL();
      // final uid = const Uuid().v1();

      UserModel user = UserModel(
        fullName: fullName,
        birthday: birthday,
        gender: gender,
        email: email,
        password: password,
        profilePicUrl: downloadUrl,
        uid: _auth.currentUser!.uid,
        friends: const [],
        sentRequests: const [],
        receivedRequests: const [],
      );
      await _firestore
          .collection(FirebaseCollectionNames.users)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(
            user.toMap(),
          );

      return credential;
    } catch (e) {
      showToastMessage(text: e.toString());
    }
    return null;

    // save user detail to firestore
  }

  // Verify Email
  Future<String?> verifyEmail() async {
    final user = FirebaseAuth.instance.currentUser;
    try {
      if (user != null) {
        user.sendEmailVerification();
      }
      return null;
    } catch (e) {
      showToastMessage(text: e.toString());
    }
    return null;
  }

  // get- user info

  Future<UserModel> getUserInfo() async {
    final userData = await _firestore
        .collection(FirebaseCollectionNames.users)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    final user = UserModel.fromMap(userData.data()!);
    return user;
  }
}
