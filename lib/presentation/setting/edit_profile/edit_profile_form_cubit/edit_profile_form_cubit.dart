import 'package:chatapp/core/config/app_enum.dart';
import 'package:chatapp/core/utils/formz/phone_number.dart';
import 'package:chatapp/domain/modules/user/user_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'edit_profile_form_state.dart';
part 'edit_profile_form_cubit.freezed.dart';

@Injectable()
class EditProfileFormCubit extends Cubit<EditProfileFormState> {
  EditProfileFormCubit({required UserUseCase userUseCase})
      : _userUseCase = userUseCase,
        super(const EditProfileFormState.initial());

  final UserUseCase _userUseCase;

  Future<void> fullnameChanged(String? value) async {
    emit(state.copyWith(name: value));
  }

  void phoneNumberChanged(String? value) {
    emit(state.copyWith(phoneNumber: PhoneNumber.dirty(value ?? "")));
  }

  void birthdayChanged(DateTime value) {
    emit(state.copyWith(birthday: value));
  }

  void genderChanged(AppGender value) {
    emit(state.copyWith(gender: value));
  }

  void bioChanged(String? value) {
    emit(state.copyWith(bio: value));
  }

  // Future<void> submitEditProfileForm({
  //   String? name,
  //   String? gender,
  //   String? phone,
  //   DateTime? birthday,
  // }) async {
  //   try {
  //     await _userUseCase.updateSelf(
  //         name: name, gender: gender, phone: phone, birthday: birthday);
  //     emit(const ChangedEditProfileSuccess());
  //   } catch (e) {
  //     emit(ChangedEditProfileFailure(message: e.toString()));
  //   }
  // }
}
