import 'dart:async';
import 'dart:developer' as developer;

import 'package:connecting_to_react_app/logic/model/create_costumers.dart';
import 'package:connecting_to_react_app/logic/repo/api_repository.dart';
import 'package:meta/meta.dart';

import 'api_bloc.dart';
import 'api_state.dart';

@immutable
abstract class ApiEvent {
  Stream<ApiState> applyAsync({ApiState currentState, ApiBloc bloc});
}

class UnApiEvent extends ApiEvent {
  @override
  Stream<ApiState> applyAsync({ApiState? currentState, ApiBloc? bloc}) async* {
    yield const InitializedApiState();
  }
}

class LoadApiEvent extends ApiEvent {
  final ApiRepository apiRepository;

  LoadApiEvent({required this.apiRepository});
  @override
  Stream<ApiState> applyAsync({ApiState? currentState, ApiBloc? bloc}) async* {
    try {
      yield const LoadingApiState();
      var data = await apiRepository.fetchCustomerApi();
      yield FetchedApiState(data!);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadApiEvent', error: _, stackTrace: stackTrace);
      yield ErrorApiState(_.toString());
    }
  }
}

class CreateNewCostumersApiEvent extends ApiEvent {
  final ApiRepository apiRepository;
  final CreateCustomersModel customersModel;

  CreateNewCostumersApiEvent({required this.apiRepository,required this.customersModel});
  @override
  Stream<ApiState> applyAsync({ApiState? currentState, ApiBloc? bloc}) async* {
    try {
      yield const LoadingApiState();
      var data = await apiRepository.createCustomersApi(newCostumers: customersModel);
      yield NewCustomerCreatedApiState(data!);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadApiEvent', error: _, stackTrace: stackTrace);
      yield ErrorApiState(_.toString());
    }
  }
}


class DeleteCostumersApiEvent extends ApiEvent {
  final ApiRepository apiRepository;
  final String id;

  DeleteCostumersApiEvent({required this.apiRepository,required this.id});
  @override
  Stream<ApiState> applyAsync({ApiState? currentState, ApiBloc? bloc}) async* {
    try {
      yield const LoadingApiState();
      var data = await apiRepository.deleteCustomersApi(id: id);
      yield DeleteAPiState(data!);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadApiEvent', error: _, stackTrace: stackTrace);
      yield ErrorApiState(_.toString());
    }
  }
}
