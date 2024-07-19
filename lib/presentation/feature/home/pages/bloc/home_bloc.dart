import 'package:bloc/bloc.dart';
import 'package:flutter_clean_architecture/presentation/blocs/bloc_state.dart';
import 'package:flutter_clean_architecture/domain/entities/person_entity.dart';
import 'package:flutter_clean_architecture/domain/use_case/person_create_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/shared_data/pref_keys.dart';

@injectable
class HomeBloc extends Cubit<BlocState<PersonEntity>> {
  HomeBloc(
    this._personCreateUseCase,
  ) : super(BlocState());

  final PersonCreateUseCase _personCreateUseCase;

  void createPerson() async {
    emit(BlocState(status: Status.loading));
    try {
      final input = PersonCreateInput(
        payload: const PersonEntity(
          name: 'John Doe',
          age: 30,
          address: 'New York',
        ),
      );
      final res = await _personCreateUseCase.buildUseCase(input);
      if(res.response.code == PrefKeys.statusSuccess) {
        emit(BlocState(status: Status.success, data: res.response.data));
      } else {
        emit(BlocState(status: Status.error, msg: res.response.message.toString()));
      }
    } catch (e) {
      emit(BlocState(status: Status.error, msg: e.toString()));
    }
  }
}
