import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'input_message_cubit.freezed.dart';
part 'input_message_state.dart';

@Injectable()
class InputMessageCubit extends Cubit<InputMessageState> {
  InputMessageCubit() : super(const InputMessageState.initial());

  Future<void> inputMessageChanged(String? value) async {
    emit(state.copyWith(input: value));
  }
}
