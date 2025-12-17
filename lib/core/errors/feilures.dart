class Failures {
  final String errMessage;

  const Failures({required this.errMessage});
}

class ServerFailures extends Failures {
  ServerFailures({required super.errMessage});
}
