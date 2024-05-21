import 'package:freezed_annotation/freezed_annotation.dart';

import 'io/input.dart';

abstract class BaseUseCase<Input extends BaseInput, Output> {
  @protected
  Output buildUseCase(Input input);
}

