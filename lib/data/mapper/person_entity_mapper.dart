import 'package:flutter_clean_architecture/data/mapper/base_mapper.dart';
import 'package:flutter_clean_architecture/data/model/person_model.dart';
import 'package:flutter_clean_architecture/domain/entities/person_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class PersonEntityMapper extends BaseDataMapper<PersonModel, PersonEntity>{
  @override
  PersonEntity mapToEntity(PersonModel? data) {
    return PersonEntity(
      name: data?.name ?? '',
      age: data?.age ?? 0,
      address: data?.address ?? '',
      dateOfBirth: DateTime.tryParse(data?.dateOfBirth ?? '') ?? DateTime.now(),
    );
  }
}