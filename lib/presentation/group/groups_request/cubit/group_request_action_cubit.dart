import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_request_action_state.dart';
part 'group_request_action_cubit.freezed.dart';

class GroupRequestActionCubit extends Cubit<GroupRequestActionState> {
  GroupRequestActionCubit() : super(GroupRequestActionState.initial());
}
