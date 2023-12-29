import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_clo/core/constants/firebase_collection_names.dart';
import 'package:facebook_clo/core/constants/firebase_field_names.dart';
import 'package:facebook_clo/features/post/models/post_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAllVideoProvider = StreamProvider.autoDispose<Iterable<Post>>((ref) {
  final controller = StreamController<Iterable<Post>>();
  final sub = FirebaseFirestore.instance
      .collection(FirebaseCollectionNames.posts)
      .where(FirebaseFieldNames.postType, isEqualTo: "video")
      .orderBy(FirebaseFieldNames.createdAt, descending: true)
      .snapshots()
      .listen((snapshot) {
    final posts = snapshot.docs.map(
      (postData) => Post.fromMap(
        postData.data(),
      ),
    );
    controller.sink.add(posts);
  });
  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
});
