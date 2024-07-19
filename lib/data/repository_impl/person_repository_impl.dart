import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/data/api/api_path.dart';
import 'package:flutter_clean_architecture/data/model/response.dart';
import 'package:flutter_clean_architecture/data/model/person_model.dart';
import 'package:injectable/injectable.dart';

import '../api/dio.dart';
import '../../domain/repositories/person_repository.dart';

@LazySingleton(as: PersonRepository)
class PersonRepositoryImpl implements PersonRepository {
  PersonRepositoryImpl(this._dio);

  final BaseDio _dio;

  @override
  Future<BaseResponseModel<PersonModel>> create(
      {required Map<String, dynamic> payload}) async {
    try{
      final res = await _dio.post(Api.personDetail, data: payload);
      final data = PersonModel.fromJson(res.data['details']);
      return BaseResponseModel(
        code: res.statusCode,
        message: res.data['message'],
        data: data,
      );
    } on DioException catch (e) {
      return BaseResponseModel(
        code: e.response?.statusCode,
        message: e.response?.data['message'],
      );
    }
  }

  @override
  Future<BaseResponseModel> delete(int id) async {
    try{
      final res = await _dio.delete('${Api.personDetail}/$id');
      return BaseResponseModel(
        code: res.statusCode,
        message: res.data['message'],
      );
    } on DioException catch (e) {
      return BaseResponseModel(
        code: e.response?.statusCode,
        message: e.response?.data['message'],
      );
    }
  }

  @override
  Future<BaseResponseModel<PersonModel>> getPerson(int id) async {
    try{
      final res = await _dio.get('${Api.personDetail}/$id');
      final data = PersonModel.fromJson(res.data['details']);
      return BaseResponseModel(
        code: res.statusCode,
        message: res.data['message'],
        data: data,
      );
    } on DioException catch (e) {
      return BaseResponseModel(
        code: e.response?.statusCode,
        message: e.response?.data['message'],
      );
    }
  }

  @override
  Future<BaseResponseModel<List<PersonModel>>> getPersons() async {
    try{
      final res = await  _dio.get(Api.personList);
      final data = res.data['details'].map((e) => PersonModel.fromJson(e)).toList();
      return BaseResponseModel(
        code: res.statusCode,
        message: res.data['message'],
        data: data,
      );
    } on DioException catch (e) {
      return BaseResponseModel(
        code: e.response?.statusCode,
        message: e.response?.data['message'],
      );

    }
  }

  @override
  Future<BaseResponseModel<PersonModel>> update(
      int id, Map<String, dynamic> payload) async {
    try{
      final res = await _dio.put('${Api.personDetail}/$id', data: payload);
      final data = PersonModel.fromJson(res.data['details']);
      return BaseResponseModel(
        code: res.statusCode,
        message: res.data['message'],
        data: data,
      );
    } on DioException catch (e) {
      return BaseResponseModel(
        code: e.response?.statusCode,
        message: e.response?.data['message'],
      );
    }
  }
}
