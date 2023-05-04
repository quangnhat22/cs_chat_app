import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'setting_main_state.dart';
part 'setting_main_cubit.freezed.dart';

@Injectable()
class SettingMainCubit extends Cubit<SettingMainState> {
  SettingMainCubit() : super(const SettingMainState.initial());
}
