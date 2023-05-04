part of 'edit_form_submit_bloc.dart';

@freezed
class EditFormSubmitEvent with _$EditFormSubmitEvent {
  const factory EditFormSubmitEvent.editProfileSubmitted({
    String? name,
    PhoneNumber? phoneNumber,
    DateTime? birthday,
    AppGender? gender,
    String? bio,
  }) = EditFormSubmitted;
}
