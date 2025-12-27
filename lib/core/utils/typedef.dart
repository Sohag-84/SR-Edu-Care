import 'package:fpdart/fpdart.dart';
import 'package:sr_edu_care/core/error_handler/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
