import 'package:cloud_firestore/cloud_firestore.dart' show Timestamp;
import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeConverter extends JsonConverter<DateTime, Timestamp> {
  const DateTimeConverter();
  @override
  DateTime fromJson(Timestamp json) => json.toDate();

  @override
  Timestamp toJson(DateTime object) => Timestamp.fromDate(object);
}

class DateTimeNullConverter extends JsonConverter<DateTime?, Timestamp?> {
  const DateTimeNullConverter();
  @override
  DateTime? fromJson(Timestamp? json) => json?.toDate();

  @override
  Timestamp? toJson(DateTime? object) =>
      object != null ? Timestamp.fromDate(object) : null;
}
