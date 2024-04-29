import 'dart:convert';

BaseResponseModel baseResponseModelFromJson(String str) =>
    BaseResponseModel.fromJson(json.decode(str));

String baseResponseModelToJson(BaseResponseModel data) =>
    json.encode(data.toJson());

class BaseResponseModel<T> {
  final int? code;
  final String? message;
  final T? data;
  final dynamic extra;

  BaseResponseModel({
    this.code,
    this.message,
    this.data,
    this.extra,
  });

  BaseResponseModel<T> copyWith({
    int? code,
    String? message,
    T? data,
    dynamic extra,
  }) =>
      BaseResponseModel(
        code: code ?? this.code,
        message: message ?? this.message,
        data: data ?? this.data,
        extra: extra ?? this.extra,
      );

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) =>
      BaseResponseModel(
        code: json['code'],
        message: json['message'],
        data: json['details'],
        extra: json['extra'],
      );

  Map<String, dynamic> toJson() => {
    'code': code,
    'message': message,
    'data': data,
    'extra': extra,
  };
}
