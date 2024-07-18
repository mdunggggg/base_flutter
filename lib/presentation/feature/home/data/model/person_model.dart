import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_model.freezed.dart';
part 'person_model.g.dart';

@freezed
class PersonModel with _$PersonModel {
  const PersonModel._();

  const factory PersonModel({
    String? name,
    int? age,
    String? address,
    String? dateOfBirth,
  }) = _PersonModel;

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);

}
