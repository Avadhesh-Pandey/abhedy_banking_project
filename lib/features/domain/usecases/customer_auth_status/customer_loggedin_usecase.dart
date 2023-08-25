import 'package:abhedy_banking_project/core/error/failure.dart';
import 'package:abhedy_banking_project/core/usecases/usecase.dart';
import 'package:abhedy_banking_project/features/domain/repositories/customer_details_repository.dart';
import 'package:dartz/dartz.dart';

class IsCustomerLoggedInUseCase implements UseCase<bool, NoParams> {
  final CustomerDetailsRepository customerDetailsRepository;

  IsCustomerLoggedInUseCase(this.customerDetailsRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return customerDetailsRepository.isCustomerLoggedIn();
  }
}
