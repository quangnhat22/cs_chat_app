import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'friends_contact_event.dart';
part 'friends_contact_state.dart';
part 'friends_contact_bloc.freezed.dart';

class FriendsContactBloc extends Bloc<FriendsContactEvent, FriendsContactState> {
  FriendsContactBloc() : super(_Initial()) {
    on<FriendsContactEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
