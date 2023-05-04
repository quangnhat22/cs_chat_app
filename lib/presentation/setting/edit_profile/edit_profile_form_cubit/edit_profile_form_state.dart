part of 'edit_profile_form_cubit.dart';

// @freezed
// class EditProfileFormState with _$EditProfileFormState {
//   const factory EditProfileFormState({
//     String? name,
//     PhoneNumber? phoneNumber,
//     DateTime? birthday,
//     AppGender? gender,
//     String? bio,
//   }) = _EditProfileFormState;

//   factory EditProfileFormState.initial() => EditProfileFormState(
//         name: '',
//         phoneNumber: const PhoneNumber.pure(),
//         birthday: DateTime.now(),
//         gender: AppGender.others,
//         bio: '',
//       );
// }

@freezed
class EditProfileFormState with _$EditProfileFormState {
  const factory EditProfileFormState.initial({
    String? name,
    @Default(PhoneNumber.pure()) PhoneNumber? phoneNumber,
    DateTime? birthday,
    @Default(AppGender.others) AppGender? gender,
    String? bio,
  }) = _Initial;
}
