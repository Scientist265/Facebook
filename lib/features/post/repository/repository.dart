import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_clo/core/constants/firebase_collection_names.dart';
import 'package:facebook_clo/core/constants/firebase_field_names.dart';
import 'package:facebook_clo/features/post/repository/models/post_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:uuid/uuid.dart';

@immutable
class PostReository {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  // Make post
  Future<String?> makePost({
    required String content,
    required File file,
    required String postType,
  }) async {
    try {
      final postId = const Uuid().v1();
      final posterId = _auth.currentUser!.uid;
      final now = DateTime.now();

      //Post file to storage
      final fileUid = const Uuid().v1();
      final path = _storage.ref(postType).child(fileUid);
      final taskSnapshot = await path.putFile(file);
      final downLoadUrl = await taskSnapshot.ref.getDownloadURL();

      //create our post

      Post post = Post(
        postId: postId,
        posterId: posterId,
        content: content,
        postType: postType,
        fileUrl: downLoadUrl,
        createdAt: now,
        likes: [],
      );

      // post to firestore

      _firestore
          .collection(FirebaseCollectionNames.posts)
          .doc(postId)
          .set(post.toMap());
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  // Like a post
  Future<String?> likeDislikePost({
    required String postId,
    required List<String> likes,
  }) async {
    try {
      final authorId = _auth.currentUser!.uid;
      if (likes.contains(authorId)) {
        _firestore
            .collection(FirebaseCollectionNames.posts)
            .doc(postId)
            .update({
          FirebaseFieldNames.likes: FieldValue.arrayRemove([authorId])
        });
      }
      else{
        //we need to like the post
          _firestore
            .collection(FirebaseCollectionNames.posts)
            .doc(postId)
            .update({
          FirebaseFieldNames.likes: FieldValue.arrayUnion([authorId])
        }); 
      }
      return null;
    } catch (e) {
      print(e);
    }
  }
}
