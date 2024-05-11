import 'package:bloc/bloc.dart';
import 'package:flutter_clean_architecture/presentation/feature/home/domain/use_case/person_create_use_case.dart';
import 'package:injectable/injectable.dart';

import '../domain/entities/person_entity.dart';
import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._personCreateUseCase,
  ) : super(const HomeState());

  final PersonCreateUseCase _personCreateUseCase;

  void createPerson() async {
    emit(state.copyWith(isLoading: true));
    final res = await _personCreateUseCase.buildUseCase(PersonCreateInput(
      payload: const PersonEntity(
        name: 'John Doe',
        age: 25,
        address: 'Jakarta',
      ),
    ));
    if (res.response.code == 200) {
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } else {
      emit(state.copyWith(isLoading: false, isFailure: true));
    }
  }
}
