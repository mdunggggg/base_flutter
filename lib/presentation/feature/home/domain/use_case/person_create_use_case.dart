import 'package:flutter_clean_architecture/domain/use_case/future_use_case.dart';
import 'package:flutter_clean_architecture/presentation/feature/home/data/mapper/person_entity_mapper.dart';
import 'package:flutter_clean_architecture/presentation/feature/home/domain/entities/person_entity.dart';
import 'package:flutter_clean_architecture/presentation/feature/home/domain/repository/person_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/model/response.dart';
import '../../../../../domain/use_case/io/input.dart';
import '../../../../../domain/use_case/io/output.dart';

@injectable
class PersonCreateUseCase
    extends BaseFutureUseCase<PersonCreateInput, PersonCreateOutput> {
  PersonCreateUseCase(
    this._personRepository,
    this._personEntityMapper,
  );

  final PersonRepository _personRepository;
  final PersonEntityMapper _personEntityMapper;

  @override
  Future<PersonCreateOutput> buildUseCase(PersonCreateInput input) async {
    final payload = {
      'name': input.payload.name,
      'age': input.payload.age,
      'address': input.payload.address,
    };

    final res = await _personRepository.create(payload: payload);
    // return PersonCreateOutput(
    //   response: BaseResponseModel(
    //     code: 200,
    //     message: 'Success',
    //     data: const PersonEntity(
    //       name: "Dung",
    //       age: 12,
    //       address: "Nam Dinh",
    //     )
    //   ),
    // );
    final dataEntity = _personEntityMapper.mapToEntity(res.data);
    final output = PersonCreateOutput(
      response: BaseResponseModel(
        code: res.code,
        message: res.message,
        data: dataEntity,
      ),
    );
    return output;
  }
}

class PersonCreateInput extends BaseInput {
  final PersonEntity payload;

  PersonCreateInput({required this.payload});
}

class PersonCreateOutput extends BaseOutput {
  final BaseResponseModel<PersonEntity> response;

  PersonCreateOutput({required this.response});
}
