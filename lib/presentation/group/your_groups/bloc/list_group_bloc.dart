import 'package:chatapp/domain/modules/group/group_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/group_entity.dart';

part 'list_group_bloc.freezed.dart';
part 'list_group_event.dart';
part 'list_group_state.dart';

@Injectable()
class ListGroupBloc extends Bloc<ListGroupEvent, ListGroupState> {
  ListGroupBloc({required GroupUseCase groupUC})
      : _groupUC = groupUC,
        super(const _Initial()) {
    on<ListGroupEvent>((event, emit) async {
      await event.map(
        started: (event) => _started(event, emit),
        refreshed: (event) => _refresh(event, emit),
      );
    });
  }

  final GroupUseCase _groupUC;

  Future<void> _started(_Started event, Emitter<ListGroupState> emit) async {
    try {
      emit(const GetListGroupInProgress());
      final listGroup = await _groupUC.getListGroup();
      emit(GetListGroupInSuccess(listGroup: listGroup));
    } catch (e) {
      emit(GetListGroupInFailed(message: e.toString()));
    }
  }

  Future<void> _refresh(
      ListGroupRefreshed event, Emitter<ListGroupState> emit) async {
    try {
      final listGroup = await _groupUC.getListGroup();
      emit(GetListGroupInSuccess(listGroup: listGroup));
    } catch (e) {
      emit(GetListGroupInFailed(message: e.toString()));
    }
  }
}
