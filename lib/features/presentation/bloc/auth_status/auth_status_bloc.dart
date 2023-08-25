
import 'package:abhedy_banking_project/core/usecases/usecase.dart';
import 'package:abhedy_banking_project/features/domain/usecases/customer_auth_status/customer_details_usecase.dart';
import 'package:abhedy_banking_project/features/domain/usecases/customer_auth_status/customer_loggedin_usecase.dart';
import 'package:abhedy_banking_project/features/domain/usecases/customer_auth_status/save_customer_details_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_status_event.dart';
part 'auth_status_state.dart';

class AuthStatusBloc extends Bloc<AuthStatusEvent, AuthStatusState> {
  final IsCustomerLoggedInUseCase isCustomerLoggedInUseCase;
  final SaveCustomerDetailsUseCase saveCustomerDetailsUseCase;
  final CustomerDetailsUseCase customerDetailsUseCase;

  AuthStatusBloc({
    required this.isCustomerLoggedInUseCase,
    required this.saveCustomerDetailsUseCase,
    required this.customerDetailsUseCase
  }) : super(AuthStatusInitial()) {
    on<AuthStatusEvent>((event, emit) async {
      if (event is GetCustomerAuthStatusEvent) {
        emit(LoadingAuthStatus());
        await Future.delayed(const Duration(seconds: 3));
        final failureOrAuthStatus = await isCustomerLoggedInUseCase(NoParams());
        failureOrAuthStatus.fold(
          (failure) => emit(CustomerIsNotAuthenticated()),
          (isAuthenticatedCustomer) => isAuthenticatedCustomer?emit(CustomerIsAuthenticated()):emit(CustomerIsNotAuthenticated()),
        );
      }
      else if(event is SetCustomerAuthStatusEvent)
        {
          emit(LoadingAuthStatus());
          final failureOrAuthStatus = await saveCustomerDetailsUseCase(event.customersName);
          failureOrAuthStatus.fold(
                (failure) => emit(ErrorSettingAuthStatus()),
                (success) => emit(AuthStatusSetSuccessfully()),
          );
        }
      else if(event is GetCustomersNameEvent)
        {
          emit(LoadingAuthStatus());
          final failureOrAuthStatus = await customerDetailsUseCase(NoParams());
          failureOrAuthStatus.fold(
                (failure) => emit(ErrorRetrievingCustomersNameSuccessfully()),
                (success) => emit(CustomersNameRetrievedSuccessfully(success)),
          );
        }
    });
  }
}
