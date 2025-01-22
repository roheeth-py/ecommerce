abstract class Failure{
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure{
  @override
  final String message;

  ServerFailure({required this.message}) : super(message: message);
}
