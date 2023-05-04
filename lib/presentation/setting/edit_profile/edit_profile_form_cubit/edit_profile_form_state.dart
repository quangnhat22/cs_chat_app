part of 'edit_profile_form_cubit.dart';

@freezed
class EditProfileFormState with _$EditProfileFormState {
  const factory EditProfileFormState.initial({
    String? name,
    @Default(PhoneNumber.pure()) PhoneNumber? phoneNumber,
    DateTime? birthday,
    @Default(AppGender.others) AppGender gender,
    String? bio,
  }) = _Initial;
}
