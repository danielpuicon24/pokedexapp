import 'package:multiple_result/multiple_result.dart';

abstract class BaseUseCase<TParam, TResult> {
  Future<Result<TResult, String>> call(TParam param);
}
