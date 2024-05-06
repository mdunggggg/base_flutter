import 'io/input.dart';
import 'io/output.dart';
import 'use_case.dart';

abstract class BaseFutureUseCase<Input extends BaseInput,
Output extends BaseOutput> extends BaseUseCase<Input, Future<Output>> {
  BaseFutureUseCase();

  Future<Output> call(Input input) async {
    try {
      final output = await buildUseCase(input);
      return output;
    } catch (e) {
      rethrow;
    }
  }
}