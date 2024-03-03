import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internship_raion/models/models.dart';
import 'package:internship_raion/services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is LoadUser) {
        User user = await UserServices.getUser(event.id);
        emit(UserLoaded(user));
      } else if (event is SignOut) {
        emit(UserInitial());
      }
    });
  }
}
