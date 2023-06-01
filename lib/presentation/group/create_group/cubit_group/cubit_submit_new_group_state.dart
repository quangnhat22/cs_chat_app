part of 'cubit_submit_new_group_cubit.dart';

@freezed
class CubitSubmitNewGroupState with _$CubitSubmitNewGroupState {
  const factory CubitSubmitNewGroupState.initial() = _Initial;
  const factory CubitSubmitNewGroupState.submitInProgress() =
      CreateGroupInProgress;
  const factory CubitSubmitNewGroupState.submitSuccess() = CreateGroupSuccess;
  const factory CubitSubmitNewGroupState.submitFailed({String? message}) =
      CreateGroupFailed;
}
