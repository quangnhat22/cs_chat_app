import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_group_request_event.dart';
part 'list_group_request_state.dart';
part 'list_group_request_bloc.freezed.dart';

class ListGroupRequestBloc extends Bloc<ListGroupRequestEvent, ListGroupRequestState> {
  ListGroupRequestBloc() : super(_Initial()) {
    on<ListGroupRequestEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
