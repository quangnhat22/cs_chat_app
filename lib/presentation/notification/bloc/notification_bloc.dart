import 'package:chatapp/domain/entities/notification_entity.dart';
import 'package:chatapp/domain/modules/notification/notification_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

@Injectable()
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationUseCase _notiUseCase;

  NotificationBloc(this._notiUseCase) : super(const _Initial()) {
    on<NotificationEvent>((event, emit) async {
      await event.map(
          started: (event) => _started(event, emit),
          notificationDeleted: (event) => _notificationDeleted(event, emit),
          listNotificationDeleted: (event) =>
              _listNotificationDeleted(event, emit),
          actionWithNotification: (event) =>
              _actionWithNotification(event, emit));
    });
  }

  Future<void> _started(_Started event, Emitter<NotificationState> emit) async {
    try {
      emit(const GetListNotificationInProgress());
      final listNoti = await _notiUseCase.getListNotification();
      emit(GetListNotificationInSuccess(listNotification: listNoti));
    } catch (e) {
      emit(GetListNotificationInFail(message: e.toString()));
    }
  }

  _notificationDeleted(
      NotificationDeletedById event, Emitter<NotificationState> emit) {}

  _listNotificationDeleted(
      ListNotificationDeleted event, Emitter<NotificationState> emit) {}

  _actionWithNotification(
      NotifcationTapped event, Emitter<NotificationState> emit) {}
}
