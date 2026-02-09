import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';

abstract class UseCase<Types, Parameters> {
  Future<Either<Failure, Types>> call({Parameters? parameters});
}
