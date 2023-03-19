import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserDatabaseService {
  final String userUid;
  UserDatabaseService({required this.userUid});

  // collection referenct
  final CollectionReference userCollectionReference =
      FirebaseFirestore.instance.collection('user');

  // userCollectionReference.add(demoData);

  Future addUserDataWhileRegistration(
    String name,
    String email,
  ) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'email': email,
    });
  }

  Future addUserDataAfterPdfUpload(
    List<String> skills,
    List<String> education,
    List<String> project,
    List<String> experience,
    List<String> appliedFor,
    List<String> acceptedFor,

  ) async {
    await FirebaseFirestore.instance.collection('users').add({
      'skills': skills,
      'education': education,
      'project': project,
      'experience': experience,
      'applied for': appliedFor,
      'accepted for': acceptedFor,
    });
  }
}
