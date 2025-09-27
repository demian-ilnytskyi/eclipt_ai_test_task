import 'dart:developer' show log;

import 'package:cloud_firestore/cloud_firestore.dart'
    show
        DocumentChangeType,
        FirebaseException,
        FirebaseFirestore,
        GetOptions,
        QuerySnapshot,
        SetOptions,
        Settings,
        Source;
import 'package:exlipt_ai_test_task/shared/shared_dart.dart';
import 'package:freezed_annotation/freezed_annotation.dart'
    show visibleForTesting;
import 'package:injectable/injectable.dart';

/// COMMENT: Class to get, update, delete or set values in firebase
@Singleton(order: -1)
class FirestoreService {
  const FirestoreService({required FirebaseFirestore firebaseFirestore})
    : _db = firebaseFirestore;
  final FirebaseFirestore _db;

  @visibleForTesting
  static const getOptions = GetOptions();
  @visibleForTesting
  static const getCacheOptions = GetOptions(source: Source.cache);
  @visibleForTesting
  static final setMergeOptions = SetOptions(merge: true);

  Stream<UserSetting> getUserSetting(String userId) => _db
      .collection(FirebaseCollectionName.userSettings)
      .doc(userId)
      .snapshots()
      .skipWhile((snapshot) => snapshot.metadata.isFromCache)
      .map((snapshot) {
        if (snapshot.exists) {
          final source = snapshot.metadata.isFromCache._source;
          log('Data fetched from $source');
          return UserSetting.fromJson(snapshot.data()!);
        } else {
          return UserSetting.empty;
        }
      });

  Future<void> setUserSetting({
    required UserSetting userSetting,
    required String userId,
  }) async {
    final userSettingJson = userSetting.toJson();
    userSettingJson['id'] = userId;
    return _db
        .collection(FirebaseCollectionName.userSettings)
        .doc(userId)
        .set(userSettingJson, setMergeOptions);
  }
}

extension _SourceExtension on bool {
  String get _source => this ? 'cache' : 'server';
}
