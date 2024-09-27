import 'package:fpdart/fpdart.dart';
import 'package:glamee/core/error/failures.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
