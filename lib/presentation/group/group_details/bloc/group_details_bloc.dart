import 'package:bloc/bloc.dart';
import 'package:chatapp/domain/modules/group/group_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/group_entity.dart';

part 'group_details_event.dart';
part 'group_details_state.dart';
part 'group_details_bloc.freezed.dart';

class GroupDetailsBloc extends Bloc<GroupDetailsEvent, GroupDetailsState> {
  GroupDetailsBloc({required GroupUseCase groupUC})
      : _groupUC = groupUC,
        super(const _Initial()) {
    on<GroupDetailsEvent>((event, emit) async {
      await event.map(
        started: (event) => _started(event, emit),
        refreshed: (event) => _refresh(event, emit),
      );
    });
  }

  final GroupUseCase _groupUC;

  Future<void> _started(_Started event, Emitter<GroupDetailsState> emit) async {
    try {
      emit(const GetGroupDetailsInProgress());
      final groupDetails = await _groupUC.getListGroup();
      emit(GetGroupDetailsInSuccess(groupDetails: groupDetails));
    } catch (e) {
      emit(GetGroupDetailsInFailed(message: e.toString()));
    }
  }

  Future<void> _refresh(
      GroupDetailsRefreshed event, Emitter<GroupDetailsState> emit) async {
    try {
      final groupDetails = await _groupUC.getListGroup();
      emit(GetGroupDetailsInSuccess(groupDetails: groupDetails));
    } catch (e) {
      emit(GetGroupDetailsInFailed(message: e.toString()));
    }
  }
}
