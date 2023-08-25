import 'package:abhedy_banking_project/core/constants/shared_preferences_constants.dart';
import 'package:abhedy_banking_project/core/error/failure.dart';
import 'package:abhedy_banking_project/features/domain/repositories/customer_details_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CustomerDetailsRepositoryImpl implements CustomerDetailsRepository {

  final SharedPreferences sharedPreferences;

  CustomerDetailsRepositoryImpl({
    required this.sharedPreferences,
  });

  @override
  Future<Either<Failure, bool>> setCustomerAuthStatus(String customersName) async {
    await sharedPreferences.setString(spCustomersName, customersName);
    final authStatus =await sharedPreferences.setBool(spIsCustomerLoggedIn, true);
      return Right(authStatus);
  }

  @override
  Future<Either<Failure, bool>> isCustomerLoggedIn() async {
      final authStatus = sharedPreferences.getBool(spIsCustomerLoggedIn)??false;
      return Right(authStatus);
  }

  @override
  Future<Either<Failure, String>> getCustomersName() async {
    final customersName = sharedPreferences.getString(spCustomersName)??"";
    return Right(customersName);
  }
}
