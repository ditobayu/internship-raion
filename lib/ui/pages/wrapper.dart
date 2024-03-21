part of "pages.dart";

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // auth.User firebaseUser = Provider.of(context);

    final auth.User? user = context.watch<auth.User?>();

    if (user == null) {
      if ((prevPageEvent is! GoToOnboardingPage)) {
        prevPageEvent = GoToOnboardingPage();
        context.read<PageBloc>().add(prevPageEvent);
      }
    } else {
      if ((prevPageEvent is! GoToMainPage)) {
        context.read<UserBloc>().add(LoadUser(user.uid));

        prevPageEvent = GoToMainPage();
        context.read<PageBloc>().add(prevPageEvent);

        // Navigator.pushReplacementNamed(context, '/home');
      }
    }

    return BlocConsumer<PageBloc, PageState>(
      listener: (context, state) {
        if (state is OnMainPage) {
          Navigator.pushReplacementNamed(context, '/home');
        } else if (state is OnLoginPage) {
          Navigator.pushReplacementNamed(context, '/sign-in');
        } else if (state is OnOnboardingPage) {
          Navigator.pushReplacementNamed(context, '/');
        } else if (state is OnRegisterPage) {
          Navigator.pushReplacementNamed(context, '/sign-up');
        }
      },
      builder: (context, state) {
        return const OnboardingPage();

        // return BlocBuilder<PageBloc, PageState>(
        //   builder: (context, state) {
        //     print(state);
        //     if (state is OnSplashPage) {
        //       return const SplashPage();
        //     } else if (state is OnOnboardingPage) {
        //       return const OnboardingPage();
        //     } else if (state is OnLoginPage) {
        //       return const SignInPage();
        //     } else if (state is OnMainPage) {
        //       return const MainPage();
        //     } else {
        //       return const MainPage();
        //       // return const Center(child: CircularProgressIndicator());
        //     }
        //   },
        // );
      },
    );
  }
}
