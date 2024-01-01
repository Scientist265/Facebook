import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_clo/core/constants/firebase_collection_names.dart';
import 'package:facebook_clo/core/constants/firebase_field_names.dart';
import 'package:facebook_clo/core/constants/storage_folder_names.dart';
import 'package:facebook_clo/features/story/models/story_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:uuid/uuid.dart';

@immutable
class StoryRepository {
  final _auth = FirebaseAuth.instance;
  final _storage = FirebaseStorage.instance;
  final _myUid = FirebaseAuth.instance.currentUser!.uid;
  final _firestore = FirebaseFirestore.instance;

  // Post Story

  Future<String?> postStory({
    required File image,
  }) async {
    try {
      final storyId = const Uuid().v1();
      final now = DateTime.now();

      //post image to storage

      Reference ref = _storage.ref(StorageFolderNames.stories).child(storyId);
      TaskSnapshot snapshot = await ref.putFile(image);
      String downloadUrl = await snapshot.ref.getDownloadURL();

      //create Story object
      Story story = Story(
          imageUrl: downloadUrl,
          createdAt: now,
          storyId: storyId,
          authorId: _myUid,
          views: const []);

      //post story
      await _firestore
          .collection(FirebaseCollectionNames.stories)
          .doc(storyId)
          .set(story.toMap());
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  // View Story
  Future<String?> viewStory({
    required String storyId,
  }) async {
    try {
      await _firestore
          .collection(FirebaseCollectionNames.stories)
          .doc(storyId)
          .update(
        {
          FirebaseFieldNames.views: FieldValue.arrayUnion(
            [_myUid],
          ),
        },
      );

      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
