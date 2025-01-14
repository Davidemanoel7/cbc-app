class Result<Success, Failure> {
  final Success? _success;
  final Failure? _failure;

  Result._({Success? success, Failure? failure})
      : _success = success,
        _failure = failure;

  // Método para verificar se é um sucesso
  bool get isSuccess => _success != null;

  // Método para verificar se é uma falha
  bool get isFailure => _failure != null;

  // // Método para acessar o valor de sucesso
  Success get success => _success!;

  // // Método para acessar o valor de falha
  Failure get failure => _failure!;

  // Método para criar uma instância de sucesso
  static Result<Success, Failure> fromSuccess<Success, Failure>(Success value) {
    return Result._(success: value);
  }

  // Método para criar uma instância de falha
  static Result<Success, Failure> fromFailure<Success, Failure>(Failure error) {
    return Result._(failure: error);
  }
}
