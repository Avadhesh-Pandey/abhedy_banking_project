part of 'auth_status_bloc.dart';

abstract class AuthStatusEvent extends Equatable {
  const AuthStatusEvent();

  @override
  List<Object> get props => [];
}

class GetCustomerAuthStatusEvent extends AuthStatusEvent {}

class GetCustomersNameEvent extends AuthStatusEvent {}

class SetCustomerAuthStatusEvent extends AuthStatusEvent {
  final String customersName;

  const SetCustomerAuthStatusEvent(this.customersName);

  @override
  List<Object> get props => [customersName];

  @override
  String toString() => 'AuthStatusEvent { SetCustomerAuthStatusEvent: $customersName }';
}
