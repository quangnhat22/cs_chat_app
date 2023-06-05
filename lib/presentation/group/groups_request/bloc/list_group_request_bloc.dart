import 'package:chatapp/domain/entities/group_request_entity.dart';
import 'package:chatapp/domain/modules/group/group_usecase.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_group_request_event.dart';
part 'list_group_request_state.dart';
part 'list_group_request_bloc.freezed.dart';

class ListGroupRequestBloc
    extends Bloc<ListGroupRequestEvent, ListGroupRequestState> {
  ListGroupRequestBloc({required GroupUseCase groupUseCase})
      : _groupUC = groupUseCase,
        super(const _Initial()) {
    on<ListGroupRequestEvent>((event, emit) async {
      await event.map(
        started: (event) => _started(event, emit),
        listRequestRefreshed: (event) => _listRequestRefreshed(event, emit),
      );
    });
  }

  final GroupUseCase _groupUC;

  Future<void> _started(
      _Started event, Emitter<ListGroupRequestState> emit) async {
    try {
      emit(const GetListGroupRequestInProgress());
      final listSentRequest = await _groupUC.getSentRequest();
      final listReceivedRequest = await _groupUC.getReceiveRequest();
      //sort list
      listSentRequest.sortBy((sent) => sent.createdAt!);
      listReceivedRequest.sortBy((receive) => receive.createdAt!);
      emit(GetListGroupRequestSuccess(
          groupRequestSent: listSentRequest,
          groupRequestReceive: listReceivedRequest));
    } catch (e) {
      emit(GetListGroupRequestFail(message: e.toString()));
    }
  }

  Future<void> _listRequestRefreshed(ListGroupRequestRefreshed event,
      Emitter<ListGroupRequestState> emit) async {
    if (state is GetListGroupRequestSuccess) {
      add(const ListGroupRequestEvent.started());
    } else {
      return;
    }
  }
}
