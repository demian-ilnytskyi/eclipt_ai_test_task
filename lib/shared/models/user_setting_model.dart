import 'package:cloud_firestore/cloud_firestore.dart' show Timestamp;
import 'package:exlipt_ai_test_task/shared/models/convertors/date_convertor.dart';
import 'package:exlipt_ai_test_task/shared/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_setting_model.freezed.dart';
part 'user_setting_model.g.dart';

@freezed
abstract class UserSetting with _$UserSetting {
  const factory UserSetting({
    required String id,
    @DateTimeNullConverter() required DateTime? updatedAt,
    @DateTimeNullConverter() required DateTime? createdAt,
    String? message,
  }) = _UserSetting;

  // Add this private constructor
  const UserSetting._();

  factory UserSetting.fromJson(Map<String, dynamic> json) =>
      _$UserSettingFromJson(json);

  /// Empty userSetting which represents an unauthenticated user.
  static const empty = UserSetting(id: '', createdAt: null, updatedAt: null);

  /// Convenience getter to determine whether the current user setting is empty.
  bool get isEmpty => id == UserSetting.empty.id;

  /// Convenience getter to determine whether the current user setting is
  /// not empty.
  bool get isNotEmpty => id != UserSetting.empty.id;
}
