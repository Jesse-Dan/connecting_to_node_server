import 'package:connecting_to_react_app/logic/model/customer_model.dart';
import 'package:equatable/equatable.dart';

import '../model/new_user.dart';

abstract class ApiState extends Equatable {
  const ApiState();

  @override
  List<Object> get props => [];
}

/// Loading
class LoadingApiState extends ApiState {
  const LoadingApiState();

  @override
  String toString() => 'UnApiState';
}

/// UnInitialized
class InitializedApiState extends ApiState {
  const InitializedApiState();

  @override
  String toString() => 'UnApiState';
}

/// Initialized
class FetchedApiState extends ApiState {
  const FetchedApiState(this.customers);

  final CustomerDataModel customers;

  @override
  String toString() => 'InApiState $customers';

  @override
  List<Object> get props => [customers];
}

/// Initialized
class DeleteAPiState extends ApiState {
  const DeleteAPiState(this.status);

  final String status;

  @override
  String toString() => 'InApiState $status';

  @override
  List<Object> get props => [status];
}

/// Initialized
class NewCustomerCreatedApiState extends ApiState {
  const NewCustomerCreatedApiState(this.customers);

  final NewCreatedCustomersModel customers;

  @override
  String toString() => 'InApiState $customers';

  @override
  List<Object> get props => [customers];
}

class ErrorApiState extends ApiState {
  const ErrorApiState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorApiState';

  @override
  List<Object> get props => [errorMessage];
}
