import 'package:abhedy_banking_project/core/error/failure.dart';
import 'package:abhedy_banking_project/core/usecases/usecase.dart';
import 'package:abhedy_banking_project/features/domain/repositories/customer_details_repository.dart';
import 'package:dartz/dartz.dart';

class SaveCustomerDetailsUseCase implements UseCase<bool, String> {
  final CustomerDetailsRepository customerDetailsRepository;

  SaveCustomerDetailsUseCase(this.customerDetailsRepository);

  @override
  Future<Either<Failure, bool>> call(String params) async {
    return customerDetailsRepository.setCustomerAuthStatus(params);
  }
}
