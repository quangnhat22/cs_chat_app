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
        super(const EditProfileFormState.initial()) {
    initValue();
  }

  final UserUseCase _userUseCase;

  Future<void> initValue() async {
    final userInfo = await _userUseCase.getSelfFromLocal();
    if (userInfo == null) return;
    emit(state.copyWith(
      name: userInfo.name,
      phoneNumber: PhoneNumber.dirty(userInfo.phone ?? ""),
      birthday: userInfo.birthday,
      gender: AppGender.checkGenderEnum(userInfo.gender),
      bio: userInfo.bio,
    ));
  }

  void isDone() {
    if (state.name == null ||
        state.name!.isEmpty ||
        state.phoneNumber == null ||
        !state.phoneNumber!.isValid) {
      emit(state.copyWith(isDone: false));
    } else {
      emit(state.copyWith(isDone: true));
    }
  }

  Future<void> fullnameChanged(String? value) async {
    emit(state.copyWith(
      name: value,
    ));
    isDone();
  }

  void phoneNumberChanged(String? value) {
    emit(state.copyWith(phoneNumber: PhoneNumber.dirty(value ?? "")));
    isDone();
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
}
