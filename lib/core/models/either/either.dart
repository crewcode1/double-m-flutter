abstract class Either<F, S> {
  const Either();
  //Succeed factory constructor
  factory Either.succeed(S succeed) => Succeed<F, S>(succses: succeed);

  //Failed factory constructor
  factory Either.failed(F failed) => Failed<F, S>(failed: failed);

  //fold Function
  T fold<T>(T Function(F failure) onFailure, T Function(S succeed) onSuccess);
}

class Succeed<F, S> extends Either<F, S> {
  final S succses;
  const Succeed({required this.succses});

  @override
  T fold<T>(T Function(F failure) onFailure, T Function(S succeed) onSuccess) {
    return onSuccess(succses);
  }
}

class Failed<F, S> extends Either<F, S> {
  final F failed;
  const Failed({required this.failed});
  @override
  T fold<T>(T Function(F) onFailure, T Function(S) onSuccess) {
    return onFailure(failed);
  }
}
