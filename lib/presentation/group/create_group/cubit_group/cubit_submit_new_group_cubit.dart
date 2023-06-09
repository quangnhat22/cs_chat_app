import 'package:chatapp/domain/modules/group/group_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'cubit_submit_new_group_cubit.freezed.dart';
part 'cubit_submit_new_group_state.dart';

@Injectable()
class CubitSubmitNewGroupCubit extends Cubit<CubitSubmitNewGroupState> {
  CubitSubmitNewGroupCubit({required GroupUseCase groupUC})
      : _groupUC = groupUC,
        super(const CubitSubmitNewGroupState.initial());

  final GroupUseCase _groupUC;

  Future<void> createGroup(
      {required String groupName,
      String? groupAvatar,
      List<String>? members}) async {
    try {
      emit(const CreateGroupInProgress());
      final isSuccess =
          await _groupUC.createGroup(groupName, groupAvatar, members ?? []);
      if (isSuccess) {
        emit(const CreateGroupSuccess());
      } else {
        emit(const CreateGroupFailed());
      }
    } catch (e) {
      emit(CreateGroupFailed(message: e.toString()));
    }
  }
}
