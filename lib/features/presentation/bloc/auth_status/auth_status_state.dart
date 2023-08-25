part of 'auth_status_bloc.dart';

abstract class AuthStatusState extends Equatable {
  const AuthStatusState();

  @override
  List<Object> get props => [];
}

class AuthStatusInitial extends AuthStatusState {}

class LoadingAuthStatus extends AuthStatusState {}

class AuthStatusSetSuccessfully extends AuthStatusState {}

class ErrorSettingAuthStatus extends AuthStatusState {}

class CustomerIsAuthenticated extends AuthStatusState {}

class CustomerIsNotAuthenticated extends AuthStatusState {}

class CustomersNameRetrievedSuccessfully extends AuthStatusState {
  final String customersName;
  const CustomersNameRetrievedSuccessfully(this.customersName);
  @override
  List<Object> get props => [customersName];

}

class ErrorRetrievingCustomersNameSuccessfully extends AuthStatusState {}
