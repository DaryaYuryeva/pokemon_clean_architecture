import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  final String errorMessage;
  ServerFailure({required this.errorMessage});
}

class CacheFailure extends Failure {
  final String errorMessage;
  CacheFailure({required this.errorMessage});
}
