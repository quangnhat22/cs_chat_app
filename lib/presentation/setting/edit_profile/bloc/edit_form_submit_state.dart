part of 'edit_form_submit_bloc.dart';

@freezed
class EditFormSubmitState with _$EditFormSubmitState {
  const factory EditFormSubmitState.initial() = _Initial;
  const factory EditFormSubmitState.loading() = EditFormSubmitLoading;
  const factory EditFormSubmitState.success() = EditFormSubmitSuccess;
  const factory EditFormSubmitState.warning({required String warningMessage}) =
      EditFormSubmitWarning;
  const factory EditFormSubmitState.failure({required String message}) =
      EditFormSubmitFailure;
}
