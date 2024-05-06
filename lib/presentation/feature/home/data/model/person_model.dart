import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_model.freezed.dart';
part 'person_model.g.dart';

@freezed
class PersonModel with _$PersonModel {
  const PersonModel._();

  const factory PersonModel({
    @Default('') String name,
    @Default(0) int age,
    @Default('') String address,
  }) = _PersonModel;

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);

}
