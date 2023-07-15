import 'package:chatapp/core/utils/snack_bar.dart';
import 'package:chatapp/domain/entities/notification_entity.dart';
import 'package:chatapp/domain/modules/friend/friend_usecase.dart';
import 'package:chatapp/domain/modules/group/group_usecase.dart';
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
  final FriendUseCase _friendUseCase;
  final GroupUseCase _groupUseCase;

  NotificationBloc(this._notiUseCase, this._friendUseCase, this._groupUseCase)
      : super(const _Initial()) {
    on<NotificationEvent>((event, emit) async {
      await event.map(
          started: (event) => _started(event, emit),
          refreshed: (event) => _refreshed(event, emit),
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

  Future<void> _refreshed(
      NotificationRefreshed event, Emitter<NotificationState> emit) async {
    try {
      final listNoti = await _notiUseCase.getListNotification();
      emit(GetListNotificationInSuccess(listNotification: listNoti));
    } catch (e) {
      emit(GetListNotificationInFail(message: e.toString()));
    }
  }

  Future<void> _notificationDeleted(
      NotificationDeletedById event, Emitter<NotificationState> emit) async {
    try {
      final isDeleteSuccess =
          await _notiUseCase.deleteNotificationById(event.id);
      if (isDeleteSuccess) {
        SnackBarApp.showSnackBar(
            null, 'Delete notification success', TypesSnackBar.success);
        add(const NotificationRefreshed());
      } else {
        SnackBarApp.showSnackBar(
            null, 'Delete notification fail', TypesSnackBar.success);
      }
    } catch (e) {
      SnackBarApp.showSnackBar(
          null, 'Delete notification fail', TypesSnackBar.success);
      throw Exception(e.toString());
    }
  }

  Future<void> _listNotificationDeleted(
      ListNotificationDeleted event, Emitter<NotificationState> emit) async {
    try {
      final isDeleteSuccess = await _notiUseCase.deleteAllNotification();
      if (isDeleteSuccess) {
        SnackBarApp.showSnackBar(
            null, 'Delete all notification success', TypesSnackBar.success);
        add(const NotificationRefreshed());
      } else {
        SnackBarApp.showSnackBar(
            null, 'Delete all notification fail', TypesSnackBar.success);
      }
    } catch (e) {
      SnackBarApp.showSnackBar(
          null, 'Delete all notification fail', TypesSnackBar.success);
      throw Exception(e.toString());
    }
  }

  Future<void> _actionWithNotification(
      NotifcationTapped event, Emitter<NotificationState> emit) async {
    try {
      bool isSuccess = false;
      if (event.actionType == 'receive-friend-request') {
        isSuccess = event.isAccept
            ? await _friendUseCase.acceptReceiveRequest(event.id)
            : await _friendUseCase.rejectReceiveRequest(event.id);
      } else if (event.actionType == 'receive-group-request') {
        isSuccess = event.isAccept
            ? await _groupUseCase.acceptRequest(event.id)
            : await _groupUseCase.rejectRequest(event.id);
      }
      if (isSuccess) {
        SnackBarApp.showSnackBar(
            null, 'Action with notification success', TypesSnackBar.success);
        add(const NotificationRefreshed());
      } else {
        SnackBarApp.showSnackBar(
            null, 'Action with notification fail', TypesSnackBar.success);
      }
    } catch (e) {
      SnackBarApp.showSnackBar(
          null, 'Delete notification fail', TypesSnackBar.success);
      throw Exception(e.toString());
    }
  }
}
