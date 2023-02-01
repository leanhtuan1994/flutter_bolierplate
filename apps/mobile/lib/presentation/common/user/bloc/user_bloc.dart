import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../user_delegate.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) {});
  }

  late UserDelegate? delegate;
}
