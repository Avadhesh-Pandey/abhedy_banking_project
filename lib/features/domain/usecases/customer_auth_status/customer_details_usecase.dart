import 'package:abhedy_banking_project/core/error/failure.dart';
import 'package:abhedy_banking_project/core/usecases/usecase.dart';
import 'package:abhedy_banking_project/features/domain/repositories/customer_details_repository.dart';
import 'package:dartz/dartz.dart';

class CustomerDetailsUseCase implements UseCase<String, NoParams> {
  final CustomerDetailsRepository customerDetailsRepository;

  CustomerDetailsUseCase(this.customerDetailsRepository);

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return customerDetailsRepository.getCustomersName();
  }
}
