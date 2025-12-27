import 'package:sr_edu_care/core/utils/typedef.dart';

abstract interface class Usecase<SuccessType, Params> {
  // Future<Either<Failure, SuccessType>> call(Params params);
  ResultFuture<SuccessType> call(Params params);
}

class NoParams {}
