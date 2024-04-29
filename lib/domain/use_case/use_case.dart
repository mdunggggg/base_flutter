import 'package:freezed_annotation/freezed_annotation.dart';

import 'io/input.dart';

abstract class BaseUseCase<Input extends BaseInput, Output> {
  @protected
  Output buildUseCase(Input input);
}

abstract class BaseUseCaseNoInput<Output> {
  Future<Output> execute();
}

abstract class BaseUseCaseInput<Input, Output> {
  Future<Output> execute(Input input);
}