import 'package:abhedy_banking_project/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CustomerDetailsRepository {
  Future<Either<Failure, bool>> isCustomerLoggedIn();

  Future<Either<Failure, String>> getCustomersName();

  Future<Either<Failure, bool>> setCustomerAuthStatus(String customersName);
}
