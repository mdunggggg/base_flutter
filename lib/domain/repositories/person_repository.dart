import 'package:flutter_clean_architecture/data/model/person_model.dart';

import '../../data/model/response.dart';

abstract class PersonRepository {
  Future<BaseResponseModel<List<PersonModel>>> getPersons();
  Future<BaseResponseModel<PersonModel>> getPerson(int id);
  Future<BaseResponseModel<PersonModel>> create({required Map<String, dynamic> payload});
  Future<BaseResponseModel<PersonModel>> update(int id, Map<String, dynamic> payload);
  Future<BaseResponseModel> delete(int id);
}