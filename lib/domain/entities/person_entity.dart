import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_entity.freezed.dart';

@freezed
class PersonEntity with _$PersonEntity {
  const PersonEntity._();
  const factory PersonEntity({
    @Default('') String name,
    @Default(0) int age,
    @Default('') String address,
    DateTime? dateOfBirth,
  }) = _PersonEntity;
}