import 'package:chatapp/core/config/app_enum.dart';
import 'package:chatapp/core/utils/formz/phone_number.dart';
import 'package:chatapp/domain/modules/user/user_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'edit_form_submit_event.dart';
part 'edit_form_submit_state.dart';
part 'edit_form_submit_bloc.freezed.dart';

@Injectable()
class EditFormSubmitBloc
    extends Bloc<EditFormSubmitEvent, EditFormSubmitState> {
  EditFormSubmitBloc({required UserUseCase userUseCase})
      : _userUseCase = userUseCase,
        super(const _Initial()) {
    on<EditFormSubmitEvent>((event, emit) async {
      await event.map(
          editProfileSubmitted: (event) async =>
              _editProfileSubmitted(event, emit));
    });
  }

  final UserUseCase _userUseCase;

  Future<void> _editProfileSubmitted(
      EditFormSubmitted event, Emitter<EditFormSubmitState> emit) async {
    if (event.name == null || event.gender == null || event.birthday == null) {
      return;
    }

    // if (event.phoneNumber != null && event.phoneNumber!.isValid) {
    //   emit(const EditFormSubmitWarning(warningMessage: "Phone not valid"));
    //   return;
    // }

    try {
      emit(const EditFormSubmitLoading());
      final isUpdateSuccess = await _userUseCase.updateSelf(
        name: event.name,
        birthday: event.birthday,
        gender: event.gender!.value,
        phone: event.phoneNumber!.value,
      );
      if (isUpdateSuccess) {
        emit(const EditFormSubmitSuccess());
      } else {
        emit(const EditFormSubmitFailure(
            message: "Can't update profile! Try again"));
      }
    } catch (e) {
      emit(EditFormSubmitFailure(message: e.toString()));
    }
  }
}
