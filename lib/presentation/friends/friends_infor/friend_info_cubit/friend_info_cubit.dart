import 'package:chatapp/domain/entities/user_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'friend_info_state.dart';
part 'friend_info_cubit.freezed.dart';

@Injectable()
class FriendInfoCubit extends Cubit<FriendInfoState> {
  FriendInfoCubit()
      : super(FriendInfoState.initial(user: UserEntity.userEntityEmpty));

  void pageInited(UserEntity user) {
    emit(state.copyWith(user: user));
  }
}
