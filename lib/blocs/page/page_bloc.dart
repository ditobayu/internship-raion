import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(OnSplashPage()) {
    on<PageEvent>((event, emit) async {
      if (event is GoToSplashPage) {
        emit(OnSplashPage());
      } else if (event is GoToOnboardingPage) {
        emit(OnOnboardingPage());
      } else if (event is GoToLoginPage) {
        emit(OnLoginPage());
      } else if (event is GoToMainPage) {
        emit(OnMainPage());
      } else if (event is GoToRegisterPage) {
        emit(OnRegisterPage());
      }
    });
  }
}
