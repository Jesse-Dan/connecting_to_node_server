import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'api_event.dart';
import 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {

  ApiBloc(ApiState initialState) : super(initialState){
   on<ApiEvent>((event, emit) {
      return emit.forEach<ApiState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'ApiBloc', error: error, stackTrace: stackTrace);
          return ErrorApiState(error.toString());
        },
      );
    });
  }
}
