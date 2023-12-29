// ignore_for_file: public_member_api_docs, sort_constructors_firs

import 'package:facebook_clo/core/constants/firebase_field_names.dart';
import 'package:flutter/material.dart';

@immutable
class UserModel {
  final String fullName;
  final String birthday;
  final String gender;
  final String email;
  final String password;
  final String profilePicUrl;
  final String uid;
  final List<String> friends;
  final List<String> sentRequests;
  final List<String> receivedRequests;

  const UserModel(
      {required this.fullName,
      required this.birthday,
      required this.gender,
      required this.email,
      required this.password,
      required this.profilePicUrl,
      required this.uid,
      required this.friends,
      required this.sentRequests,
      required this.receivedRequests});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      FirebaseFieldNames.fullName: fullName,
      FirebaseFieldNames.birthDay: birthday,
      FirebaseFieldNames.gender: gender,
      FirebaseFieldNames.email: email,
      FirebaseFieldNames.password: password,
      FirebaseFieldNames.profilePicUrl: profilePicUrl,
      FirebaseFieldNames.uid: uid,
      FirebaseFieldNames.friends: friends,
      FirebaseFieldNames.sentRequests: sentRequests,
      FirebaseFieldNames.receivedRequests: receivedRequests,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fullName: map[FirebaseFieldNames.fullName] ?? "",
      birthday:
          DateTime.fromMillisecondsSinceEpoch(map['birthday'] ?? 0).toString(),
      gender: map[FirebaseFieldNames.gender] ?? "",
      email: map[FirebaseFieldNames.email] ?? "",
      password: map[FirebaseFieldNames.password] ?? "",
      profilePicUrl: map[FirebaseFieldNames.profilePicUrl] ?? "",
      uid: map[FirebaseFieldNames.uid] ?? "",
      friends: List<String>.from((map[FirebaseFieldNames.friends] ?? [])),
      sentRequests:
          List<String>.from((map[FirebaseFieldNames.sentRequests] ?? "")),
      receivedRequests:
          List<String>.from((map[FirebaseFieldNames.receivedRequests] ?? "")),
    );
  }
}
